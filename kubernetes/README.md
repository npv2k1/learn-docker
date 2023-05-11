# Kubenetes

## Kubenetes là gi?

Kubernetes (k8s) là một hệ thống mã nguồn mở được sử dụng để quản lý các ứng dụng đóng gói trong các container. Nó được phát triển bởi Google và hiện nay được quản lý bởi Cloud Native Computing Foundation. Kubernetes cung cấp một nền tảng quản lý ứng dụng độc lập với nền tảng, giúp cho việc triển khai, mở rộng và quản lý các ứng dụng trên các môi trường đám mây trở nên đơn giản hơn.

## Các thành phần của kubenetes

Kubernetes gồm các thành phần sau:

- **Master Node**: Quản lý và điều hành toàn bộ hệ thống Kubernetes. Master Node sẽ định nghĩa danh sách các Pod, quản lý các nút Worker Node, và phân phát các tác vụ đến các nút Worker Node.
- **Worker Node**: Là các máy chủ nơi các ứng dụng được triển khai và chạy. Mỗi Worker Node sẽ chứa một hoặc nhiều Pod, nơi các container sẽ được triển khai và chạy.
- **Pod**: Là đơn vị nhỏ nhất trong Kubernetes. Một Pod bao gồm một hoặc nhiều container, chạy trên cùng một nút Worker Node. Các container trong cùng một Pod sẽ chia sẻ tài nguyên máy chủ, bao gồm cả bộ nhớ và mạng.
- **Deployment**: Quản lý việc triển khai các Pod và các phiên bản khác nhau của chúng. Deployment cho phép bạn cập nhật hoặc scale ứng dụng một cách dễ dàng.
- **Service**: Là thành phần cung cấp một địa chỉ IP ổn định cho các Pod. Service giúp cho các ứng dụng có thể liên lạc với nhau dễ dàng hơn.
- **Volume**: Là thành phần cung cấp khả năng lưu trữ dữ liệu cho các container trong các Pod. Volume giúp cho các dữ liệu của ứng dụng được lưu trữ bền vững hơn.
