# Docker template

Tempate cấu hình chạy các app và service với docker hoặc docker-compose

## docker

Để chạy ta dùng lệnh

```bash
docker run -d --name <container_name> -p <host_port>:<container_port> <image_name>

```

`-d` Là tham số để docker chạy dưới nền

`--name` Là tham số để đặt tên cho container

`-p` Là tham số để map port từ host sang container

`<host_port>:<container_port>` Là tham số để map port từ host sang container

`<image_name>` Là tham số để chạy image

````



## docker-compose

Để chạy ta dùng lệnh

```bash
docker-compose up -d

````

`-d` Là tham số để docker chạy dưới nên

Để xem log ta dùng lệnh

```bash
docker-compose logs -f

```

`-f` Là tham số để xem log theo dõi

Để dừng ta dùng lệnh

```bash
docker-compose stop

```

Để xóa và hủy toàn bộ container ta dùng lệnh

```bash
docker-compose down

```
