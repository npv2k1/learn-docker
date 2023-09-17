# liệt kê các network trong docker
docker network ls
# liệt kê thông số của network trong docker
docker network inspect bridge
# Ánh xạ cổng 8888 ở host vào container
docker run -it --name B2 -p 8888:80 busybox
# tạo mạng mới
docker network create --driver bridge network1
# xóa mạng 
docker network rm network1
# tạo container với network 1
docker run -it --name B3 --network network1 busybox
#  ket noi B3 voi bridge
docker network connect bridge B3