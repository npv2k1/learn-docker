# [Docker] Một số hướng dẫn và ví dụ hữu ích về cách sử dụng Volume trong Docker

[May Fest](https://viblo.asia/may-fest)

`Volume` trong Docker là một cơ chế được Docker sử dụng để cung cấp khả năng lưu trữ liên tục (persistent data storage). Chúng mang lại những lợi ích đáng kể trong quá trình phát triển và triển khai ứng dụng của bạn với Docker. Nếu bạn mong muốn có thể làm chủ nền tảng docker thì cách sử dụng và quản lý `volume` là một trong những kiến thức cơ bản mà bạn cần phải nắm rõ. Vì vậy, thông qua bài viết này, mình hi vọng có thể giới thiệu đến các bạn một số hướng dẫn và ví dụ cụ thể rất hữu ích về cách sử dụng của `volume` và các lệnh `Docker Volume` trên Docker nhé.

## 1. Tạo volumes

Rất dễ dàng để bạn có thể tạo một volume với docker bằng lệnh sau:

```
docker volume create [volume_name]
```

Lệnh này sẽ tạo ra một volume lưu trữ dữ liệu có thể được sử dụng bởi một container cụ thể hoặc một được chia sẻ giữa một nhóm các container. Bây giờ bạn có thể gắn volume này vào một vị trí bên trong container. Sau khi hoàn tất, bạn có thể dễ dàng lưu trữ hoặc truy cập dữ liệu container từ máy chủ.

## 2. Hiển thị volumes

Trong thực tế làm việc, có thể bạn sẽ phải quản lý một số lượng lớn các volume dữ liệu, điều quan trọng là bạn có thể xác định được đúng các volume cụ thể mà bạn đang cần. Và bạn có thể dễ dàng liệt kê tất cả các volume hiện đang được khai báo bằng lệnh:

```
docker volume ls
```

Bạn sẽ nhận được danh sách tên tất cả các docker volume cùng với docker volume drivers tương ứng của chúng đang có trên máy chủ của bạn bằng cách chạy lệnh trên. Ngoài ra, đối với Linux thì các volume của bạn sẽ được lưu trữ tại /var/lib/docker/volumes trên máy chủ của bạn.

## 3. Kiểm tra volunes

Lệnh kiểm tra docker volume sẽ cung cấp chúng ta thông tin chi tiết về một volume cụ thể. Nó hiển thị các thông tin về volume driver, mount point, scope hay labels (nhãn) của volume.

```
docker volume inspect [volume_name]
```

Các thông tin mà lệnh này cung cấp rất hữu ích khi bạn cần khắc phục các sự cố liên quan đến volume trên docker.

![img](https://images.viblo.asia/3e57a4ef-022c-40c8-b702-33b630f9e970.png)

## 4. Xoá volumes.

Nếu như bạn đang có các volume chưa sử dụng đến thì lời khuyên là bạn nên xoá chúng đi. Xoá đi các volume không cần thiết có thể giúp bạn giải phóng không gian lưu trữ cho máy chủ của bạn.

- Khi bạn muốn xoá 1 volume cụ thể:

```
docker volume rm [volume_name]
```

- Khi bạn muốn xoá nhiều volume cùng lúc:

```
docker volume rm [volume_name_1] [volume_name_2] [volume_name_3] [...]
```

- Ngoài ra, khi bạn có một số lượng volume rất lớn cần phải xoá đi thì docker daemon còn cung cấp cho bạn một lệnh rất hữu ích nữa đó là:

```
docker volume prune
```

Một điểm rất tốt ở lệnh này đó là nó sẽ không xoá đi bất cứ volume nào của bạn đang được sử dụng bởi một container hiện có. Nó sẽ chỉ xoá đi các volume đang không được sử dụng. Do đó, lệnh này là an toàn để bạn sử dụng và rất hiệu quả trong việc giải phóng không gian lưu trữ trên các môi trường phát triển của bạn.

## 5. Tạo một container với volumes

Ở trên, mình đã giới thiệu đến các bạn các lệnh cơ bản nhất đối với docker volume. Trong thực tế, hầu như các bạn sẽ luôn cần gắn volume của mình vào các docker container. Lệnh sau đây sẽ chỉ cho các bạn cách tạo một docker container và mount volume vào container này. Nếu volume liên kết không tồn tại sẵn thì Docker Engine sẽ tạo một volume mới:

- Cách 1: Sử dụng tuỳ chọn `--volume`:

```
docker run --name [container_name] --volume "[volume_name]":/tmp [docker_image]
```

Một ví dụ cụ thể hơn cho cú pháp lệnh trên như sau:

```
docker run -d -it --name test-container --volume "exampleVolume":/tmp ubuntu:xenial
```

Bạn cũng có thể sử dụng tuỳ chọn `-v` là viết tắt thay cho `--volume`. Lệnh này sẽ tạo một container có tên test-container bằng cách sử dụng image ubuntu:xenial và gắn volume exampleVolume của mình vào vị trị `/tmp` của container này. Bạn cũng có thể kiểm tra thêm thông tin bằng lệnh kiểm tra container là `docker inspect test-container` và kiểm tra phần "Mounts" trong kết quả đầu ra:

![img](https://images.viblo.asia/d82ad4fb-4953-40ff-ab0a-1b1d46973410.png)

- Cách 2: sử dụng tuỳ chọn `--mount`:

Sử dụng tuỳ chọn `--mount` sẽ đem lại kết qủa tương tự như trên. Nhưng cú pháp khi sử dụng `--mount` rõ ràng và dài dòng hơn so với sử dụng `--volume`. Trong khi `--volume` kết hợp tất cả chỉ trong một chuỗi thì `--mount` phân tách chúng. Đối với đa số các Linux developers thì có lẽ `--mount` sẽ đem lại cái nhìn trực quan hơn so với `--volume`.

Cú pháp câu lệnh:

```
docker run --mount source=[volume_name],destination=[path_in_container] [docker_image]
```

Cụ thể với một câu lệnh tương tự như khi sử dụng `--volume`

```
docker run -d -it --name test-container --mount source=exampleVolume,target=/tmp ubuntu:xenial
```

- Lưu ý: Có một lưu ý nho nhỏ nữa cho các bạn là chỉ có `--mount` là khả dụng với `swarm mode`, còn `--volume` thì không. Vì vậy, `--mount` là cách duy nhất khả dụng khi sử dụng `docker service`

## 6. Pre-Populating volumes

Nếu bạn tạo một container với một volume liên kết như trên khi volume đó chưa có sẵn và được Docker Engine tạo mới, vậy thì nội dung của vị trí đích trong container sẽ được sao chép vào volume, sau đó volume mới được liên kết với container. Ví dụ:

```
docker run -d --name=nginxContainer -v nginxVol:/usr/share/nginx/html nginx:latest
```

Trước tiên, lệnh trên sẽ tạo volume nginxVol và điền dữ liệu vào volume với nội dung là dữ liệu của vị trí đích /usr/share/nginx/html của hệ thống file bên trong container. Bây giờ, dữ liêụ này sẽ có thể truy cập được bởi tất cả các container khác cũng có liên kết với volume nginxVol. Tương tự, bạn cũng có thể sử dụng cú pháp với `--mount` để thực hiện lệnh tương tự như trên:

```
docker run -d --name=nginxContainer --mount source=nginxVol,destination=/usr/share/nginx/html nginx:latest
```

## 7. Sử dụng Read Only Volumes

Theo mặc định, tất cả các container đều có quyền đọc và ghi dữ liệu đối với volume được liên kết với chúng. Tuy nhiên, trong thực tế vận hành, không phải container nào cũng cần ghi dữ liệu vào volume mà chỉ cần quyền đọc dữ liệu. Trong những trường hợp như vậy, bạn hoàn toàn có thể chỉ định quyền chỉ đọc cho container của mình. Bạn có thể xem ví dụ dưới đây:

```
docker run -d --name=nginxContainer -v nginxVol:/usr/share/nginx/html:ro nginx:latest
```

hay

```
docker run -d --name=nginxContainer --mount source=nginxVol,destination=/usr/share/nginx/html,readonly nginx:latest
```

Như vậy bạn chỉ cần thêm trường `:ro` với tuỳ chọn `-v` hoặc `readonly` với tuỳ chọn `--mount`, bạn sẽ có thể cấp quyền chỉ đọc dữ liêụ từ volume cho container nginxContainer.

## 8. Tạo volumes sử dụng volume drivers cụ thể.

Volume drivers là một cơ chế linh hoạt được Docker sử dụng để cung cấp quyền truy cập vào các remote mount, data encryption (mã hoá dữ liệu) và các tính năng khác. Lệnh dưới đây là ví dụ về cách tạo một volume bằng cách sử dụng một volume driver cụ thể:

```
docker volume create --driver vieux/sshfs -o sshcmd=test@node2:/home/session -o password=testPassword sshVolume
```

Lệnh này tạo một docker volume bằng cách sử dụng volume driver `vieux/sshfs`. Volume driver này cho phép bạn gắn các thư mục từ xa (remote directories) thông qua sử dụng SSHFS.

## 9. Khởi tạo container sử dụng một volume được tạo bởi một volumdriver cụ thể.

Bạn cũng có thể sử dụng lệnh sau để khởi tạo một container và sử dụng một volume driver cụ thể để tạo volume liên kết với container của bạn. Mình có một lệnh ví dụ được xây dựng dựa trên ví dụ phía trên như sau:

```
docker run -d --name sshfsContainer --volume-driver vieux/sshfs --mount src=sshVolume,target=/tmp,volume-opt=sshcmd=test@node2:/home/session,volume-opt=password=testPassword nginx:latest
```

Trường `volume-opt` cho phép bạn thông qua qua các tuỳ chọn. Nó không bắt buộc trong mội trường hợp sử dụng. Tuy nhiênkhi sử dụng nó, bạn sẽ buộc phải dùng với `--mount`.

## 10. Tạo Services sử dụng một NFS Volume

**NFS** hay **Network File System** là một hệ thống chia sẻ tệp phân tán. Nó cho phép bạn sử dụng hệ thống tệp từ xa (remote filesystems) như thể chúng là một phần của hệ thống tệp cục bộ. Lệnh sau đây là ví dụ cho bạn thấy cách tạo một service sử dụng NFS volume.

```
docker service create -d --name nfs-service --mount 'type=volume,source=nfsVolume,target=/tmp,volume-driver=local,volume-opt=type=nfs,volume-opt=device=:/var/docker-nfs,volume-opt=o=addr=10.0.0.10' nginx:latest
```

Lệnh trên giả định rằng máy chủ NFS đang chạy trên 10.0.0.10 và nó hiển thị thư mục /var/docker-nfs. Ở đây lệnh này chạy với NFSv3, đối với NFSv4, bạn cần điều chỉnh một chút như sau:

```
docker service create -d --name nfs-service --mount 'type=volume,source=nfsvolume,target=/app,volume-driver=local,volume-opt=type=nfs,volume-opt=device=:/var/docker-nfs,"volume-opt=o=addr=10.0.0.10,rw,nfsvers=4,async"' nginx:latest
```

## 11. Backing Up Containers

Volume cung cấp một cách linh hoạt để bạn có thể backup các dữ liệu container quan trọng. Để ví dụ, trước hết mình sẽ tạo một container mới là `test-container`:

```
docker run -v /data --name test-container ubuntu:xenial /bin/bash
```

Vậy là, container `test-continer` liên kết với một volume là `/data`. Bây giờ, mình sẽ khởi động một container khác và mount volume `data` từ `test-container`. Sau đó, mình sẽ mount một thư mục cục bộ (local directory) trện hệ thống tệp là thư mục `/backup`. Ở đây, mình thực thi một lệnh tar để lưu trữ nội dung của `/data` vào `/backup` dưới dạng `backup.tar`:

```
$ docker run --rm --volumes-from test-container -v $(pwd):/backup ubuntu:xenial tar cvf /backup/backup.tar /data
```

Cờ `--volumes-from` được dùng để khởi động một container và liên kết toàn bộ các volume đang liên kết với một container khác. Cơ chế này rất hữu dụng khi sao lưu và phục hồi volume.

## 12. Restoring Containers Backups

Và cuối cùng, rất dễ dàng để bạn có thể khôi phục container của bạn từ các tệp backup như trên. Bạn có thể khôi phục sữ liệu vào cùng một container hoặc vào một container cụ thể khác. Tiếp nối ví dụ trên, mình sẽ hướng dẫn các bạn cách khôi phục dữ liệu từ tệp `backup.tar`.

```
docker run -v /data --name test-container2 ubuntu /bin/bash
```

Đầu tiên, tạo một container với `/data` volume. Sau đó, chúng ta sẽ trích xuất dữ liệu từ `backup.tar` trong volume mới này.

```
docker run --rm --volumes-from test-container2 -v $(pwd):/backup ubuntu bash -c "cd /data && tar xvf /backup/backup.tar --strip 1"
```

Như vậy, bạn hoàn toàn có thể tự động hoá việc backup và khôi phục dữ liệu container bằng cách sử dụng các lệnh `docker volume` đơn giản nhưng rất hữu ích này.

Cảm ơn các bạn đã theo dõi bài viết của mình!

# Nguồn tham khảo

- https://docs.docker.com/storage/volumes/