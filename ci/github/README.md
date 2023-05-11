# GitHub Action for CI Docker Image

Github action cho phép build docker image rồi push nên docker registry. Để bắt đầu cần tạo github action.

`.github/workflows/build.yml`

```yml
name: Build docker image

on:
  push:
    branches: [master]
    workflow_dispatch:

jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: Set up QEMU
        uses: docker/setup-qemu-action@v2
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2
      - name: Login to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
      - name: Build and push
        uses: docker/build-push-action@v4
        with:
          context: .
          push: true
          tags: npv2k1/hello:latest
```

Thêm `DOCKERHUB_USERNAME` và `DOCKERHUB_TOKEN` vào github action secret

Sửa `tags` bằng repo trên docker hub của bạn
