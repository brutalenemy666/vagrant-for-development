server {
    listen {{HTTP_PORT}};
    server_name {{SERVER_NAME}};

    root {{SERVER_ROOT}};

    index index.php index.html index.htm index.shtml;

    client_max_body_size 3G;

    location / {
        try_files \$uri \$uri/ /index.php?\$args;
        ssi on;
        autoindex on;
    }

    location ~ \.php$ {
        try_files \$uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        fastcgi_param PHP_VALUE "max_execution_time = 300 \n max_input_time = 3000 \n upload_max_filesize = 3G \n post_max_size=3G \n short_open_tag = On \n max_input_vars = 1000 \n memory_limit = 1G \n error_reporting = E_ALL \n short_open_tag = On";
        fastcgi_read_timeout 3000;
        fastcgi_buffers 16 16k;
        fastcgi_buffer_size 32k;
        include fastcgi_params;
    }

    location /wordpress/ {
        try_files  / /wordpress/index.php?;
    }
}

# vim: syntax=nginx ts=4 sw=4 sts=4 sr noet
