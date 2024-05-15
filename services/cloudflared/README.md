# Cloudflared

Cloudflared là một dịch vụ có thể giúp tạo kết nối an toàn ra internet.

# Hướng dẫn

## Tài khoản cloudflare

Tạo tài khoản cloudflare và truy cập vào mục tunnel trong cloudflare tạo một tunnel mới. Sau khi tạo bạn sẽ nhận được token hãy tạo file `.env`

```plaintext
CLOUDFLARE_TOKEN=your_token
```

Khởi chạy cloudflared

```sh
docker-compose up -d
```

## Trỏ tên miền vào các dịch vụ

Vào mục Public hostnames và tiến hành trỏ một tiên miền mới. cloudflare được kết hợp với nginx giúp bạn có thể tạo và cấu hình một cách dễ ràng
