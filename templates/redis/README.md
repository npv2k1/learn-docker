# Redis

## Cài đặt

`docker-compose.yml`

```yaml
version: '3.8'

services:
  redis:
    image: redis/redis-stack:latest
    restart: on-failure
    volumes:
      - redis-data:/data
    ports:
      - 8001:8001
      - 6379:6379

volumes:
  redis-data:
```


Chạy redis stack bao gồm redis và công cụ quản lý

```bash
docker run -d --name redis-stack -p 6379:6379 -p 8001:8001 redis/redis-stack:latest
```

notes:

- cổng `8001` để truy cập vào công cụ quản lý
- cổng `6379` để truy cập vào redis

## Tham khảo

- https://redis.io/docs/stack/get-started/install/docker/
