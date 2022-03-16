# flamingent.com

server {
        listen 80;

        server_name flamingent.com www.flamingent.com;

        root /var/www/flamingent.com;
        index index.html index.htm;

        location / {
                try_files $uri $uri/ =404;
        }
}
