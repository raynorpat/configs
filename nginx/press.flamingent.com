# press.flamingent.com

server {
        listen 80;

        server_name press.flamingent.com;

        root /var/www/press.flamingent.com;
        index index.html index.htm;

        location / {
                try_files $uri $uri/ =404;
        }
}
