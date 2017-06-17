var app = require('http').createServer(),
    io = require('socket.io').listen(app),
    fs = require('fs'),
    mysql = require('mysql'),
    connectionsArray = [],
    connection = mysql.createConnection({
        host: '127.0.0.1',
        user: 'root',
        password: 'root',
        database: 'bwallo',
        port: 3306
    }),
    POLLING_INTERVAL = 3000,
    pollingTimer;

connection.connect(function(err){
    console.log(err);
});

app.listen(8000);

io.sockets.on('connection', function(socket){
    //console.log('Bağlı soket sayısı: ' + connectionsArray.length);

    socket.on('disconnect', function(){
        var socketIndex = connectionsArray.indexOf(socket);
        //console.log(socketIndex + '. soket çıktı.');
        if(socketIndex >= 0) {
            connectionsArray.splice(socketIndex, 1);
        }
    }).on('posts', function(wall_id){
        if(connectionsArray.length){
            pollingLoop(wall_id);
        }
    }).on('comments', function(post_id){
        if(connectionsArray.length){
            pollingLoopC(post_id);
        }
    });

    //console.log('Yeni soket bağlandı!');
    connectionsArray.push(socket);
});

var pollingLoop = function(wall_id){
    var query = connection.query('SELECT * FROM reposts INNER JOIN posts ON posts.post_id = reposts.post_idfk WHERE reposts.wall_idfk = ' + wall_id + ' ORDER BY posts.post_z ASC, posts.post_updated ASC'),
    q = connection.query('SELECT * FROM posts WHERE wallid_fk = ' + wall_id + ' ORDER BY post_z ASC, post_updated ASC'),
    posts = [];
    query
    .on('error', function(err){
        console.log(err);
        updateSockets(err);
    })
    .on('result', function(post){
        posts.push(post);
    });

    q.on('result', function(post){
        posts.push(post);
    }).on('end', function(){
        if(connectionsArray.length){
            pollingTimer = setTimeout(pollingLoop(wall_id), POLLING_INTERVAL);

            updateSockets({
                posts: posts,
                wall_id: wall_id
            });
        }
    });
};

var pollingLoopC = function(post_id){
    var query = connection.query('SELECT * FROM comments INNER JOIN users ON comments.userid_fk = users.user_id WHERE comments.postid_fk = ' + post_id + ' ORDER BY comments.comment_id DESC'),
    comments = [];
    query
    .on('error', function(err){
        console.log(err);
        updateSockets(err);
    })
    .on('result', function(comment){
        comments.push(comment);
    }).on('end', function(){
        if(connectionsArray.length){
            pollingTimer = setTimeout(pollingLoopC(post_id), POLLING_INTERVAL);

            updateSockets({
                comments: comments,
                post_id: post_id
            });
        }
    });
};

var updateSockets = function(data){
    connectionsArray.forEach(function(tmpSocket){
        tmpSocket.volatile.emit('notification', data);
    });
};