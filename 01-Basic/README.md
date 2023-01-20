# Basic

## Cài đặt docker

### Gỡ docker cũ

```bash
sudo apt-get remove docker docker-engine docker.io containerd runc
```

### Cập nhật các gói hiện có trên hệ thống

```bash
sudo apt-get update && sudo apt-get install ca-certificates curl gnupg lsb-release

```

### Thêm docker pgp key

```bash
sudo mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

### Cài đặt repository

```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

### Cài đặt docker

```bash
sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

### Chạy docker hello world

```bash
sudo docker run hello-world
```
