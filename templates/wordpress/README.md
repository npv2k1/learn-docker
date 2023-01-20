# Wordpress

Để chạy ta dùng lệnh sau:

```bash
docker-compose up -d
```

notes:

- wordpress chạy trên port 8080
- mysql chạy trên port 3306
- phpmyadmin chạy trên port 8081
- đã fix upload limit trong file `upload.ini`
- Để cấu hình url thì vào `wp-config.php` và sửa lại `WP_HOME` và `WP_SITEURL`
