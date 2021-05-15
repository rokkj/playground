server {
        listen 80 default_server;
        server_name app.example.com;

        location /xyz {
                set $url http://127.0.0.1:8888;
                proxy_pass $url;
                access_log /var/log/nginx/app_one.access.log;
                error_log /var/log/nginx/app_one.error.log;
        }

        location /pqrs {
                set $url http://127.0.0.1:8888;
                proxy_pass $url;
                access_log /var/log/nginx/app_one.access.log;
                error_log /var/log/nginx/app_one.error.log;
        }

        location /abc {
                set $url http://127.0.0.1:8080;
                proxy_pass $url;
                access_log /var/log/nginx/app_two.access.log;
                error_log /var/log/nginx/app_two.error.log;
        }

        location /mno {
                set $url http://127.0.0.1:8080;
                proxy_pass $url;
                access_log /var/log/nginx/app_two.access.log;
                error_log /var/log/nginx/app_two.error.log;
        }

}
