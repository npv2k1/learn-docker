# Alist

Một công cụ quán lý các file trên cloud hỗ trợ nhiều dịch vụ cloud khác nhau

# Hướng dẫn

## Khởi chạy Alist

```sh
docker-compose up -d
```

## Cấu hình tài khoản admin

```sh
docker exec -it alist ./alist admin set NEW_PASSWORD
```

sau khi chạy thành công thì có thể vào http://localhost:5244 đăng nhập với password vừa tạo và sử dụng
