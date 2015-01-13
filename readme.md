#_autoindex for Nginx

*介绍：自定义目录浏览页面，无需安装插件*

>安装：将_autoindex目录复制到网站（或虚拟目录）的根目录。

*<font color="red">注意：需要配置php支持, 留意下面红色部分</font>*


####主目录 配置方法：
<pre>
location / {
    index  index.html index.htm index.php **/_autoindex/index.php**;
}
location ~ \.php$ {
    fastcgi_pass   127.0.0.1:9000;
    fastcgi_index  index.php;
    fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
    include        fastcgi_params;
}
</pre>



####虚拟目录 配置方法：
<pre>
location ~ ^/sync/.+\.php$ {
    <font color="red">alias          /Users/jackchan/Sync/;</font>
    <font color="red">rewrite        /sync/(.*\.php?) /$1 break;</font>
    fastcgi_pass   127.0.0.1:9000;
    fastcgi_index  index.php;
    fastcgi_param  SCRIPT_FILENAME  <font color="red">/Users/jackchan/Sync</font>$fastcgi_script_name;
    include        fastcgi_params;
}
location /sync {
    <font color="red">alias  /Users/jackchan/Sync/;</font>
    index  index.html index.htm index.php <font color="red">/sync/_autoindex/index.php</font>;
}
</pre>


####截图：
![image](/screenshot.png)


####更多: [fulicat.com](http://fulicat.com)

