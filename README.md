bwallo.
=====

duvar tabanlı sosyal ağ.

![Screenshot](ss.png)

https://www.youtube.com/watch?v=SgJayZVxk3g&t=156s


.htaccess yükleyemedim Github'a:

Options +FollowSymLinks  
RewriteEngine On  
RewriteCond %{SCRIPT_FILENAME} !-d  
RewriteCond %{SCRIPT_FILENAME} !-f  
RewriteRule ^([a-zA-Z0-9_-]+)$ index.php?do=$1
RewriteRule ^([a-zA-Z0-9_-]+)/$ index.php?do=$1
RewriteRule ^users/([^/]+)$ index.php?do=profile&user_name=$1
RewriteRule ^users/([^/]+)/$ index.php?do=profile&user_name=$1
RewriteRule ^wall/([^.]+)/post/([0-9_-]+)$ index.php?do=wall&wall_domain=$1&article_id=$2
RewriteRule ^wall/([^.]+)/post/([0-9_-]+)/$ index.php?do=wall&wall_domain=$1&article_id=$2 
RewriteRule ^wall/([^.]+)/$ index.php?do=wall&wall_domain=$1
RewriteRule ^wall/([^.]+)$ index.php?do=wall&wall_domain=$1
RewriteRule ^delete-wall/([^.]+)$ index.php?do=delete-wall&wall_domain=$1
RewriteRule ^delete-wall/([^.]+)/$ index.php?do=delete-wall&wall_domain=$1
RewriteRule ^page/([^.]+)$ index.php?do=page&page_name=$1
RewriteRule ^page/([^.]+)/$ index.php?do=page&page_name=$1
RewriteRule ^search/([^.]+)$ index.php?do=search&src=$1
RewriteRule ^search/([^.]+)/$ index.php?do=search&src=$1
ErrorDocument 404 "<script type='text/javascript'>window.location.href = '/404'</script>"
