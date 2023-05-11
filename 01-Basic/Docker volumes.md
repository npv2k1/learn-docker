# Docker volumes

Docker volumes là một tính năng quan trọng của Docker cho phép các ứng dụng chạy trên Docker container có thể lưu trữ và truy cập dữ liệu mà không bị mất khi container bị xóa hoặc khởi động lại. Nó cho phép dữ liệu được lưu trữ và truy cập bên ngoài container và được chia sẻ giữa nhiều container.

Khi sử dụng docker compose với mount volumes nó ưu tiên mount và ghi đề folder bằng dữ liệu trong volumes

- https://docs.docker.com/storage/volumes/
