# raynorpat.com

server {
        listen 80;

        server_name raynorpat.com www.raynorpat.com;

        root /var/www/raynorpat.com;
        index index.html index.htm;

        location / {
                try_files $uri $uri/ =404;
        }

	location ~ /\. {
		deny all;
	}
}

