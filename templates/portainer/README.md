# Portainer

Là công cụ dùng để quản lý docker và docker-compose trên giao diện

## Cài đặt

Tạo portainer volume để chứa data của portainer.
Cấu trúc lệnh `docker volume create <volume_name>`

```bash
docker volume create portainer_data
```

Chạy portainer

```bash
docker run -d -p 8000:8000 -p 9443:9443 -p 9000:9000 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:alpine
```

| Tham số          | Ý nghĩa                        |
| ---------------- | ------------------------------ |
| -d               | Chạy container dưới nền        |
| -p               | Map port ra ngoài máy host     |
| --name           | Tên container                  |
| --restart=always | Chạy lại container khi bị dừng |
| -v               | Mount volume                   |

notes

- portainer sẽ chạy trên port `9000`. Để truy cập vào portainer ta truy cập vào địa chỉ `http://<host_ip>:9000`

- port `9443` là port để truy cập vào portainer qua https

- port `8000` là port dùng để kết nối nhiều container ở nhiều host với nhau.

## Tham khảo

https://docs.portainer.io/start/install/server/docker/linux
