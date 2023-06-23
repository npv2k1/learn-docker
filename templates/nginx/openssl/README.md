# OpenSSL

## Generate a self-signed certificate

file config: `openssl.conf`

File này chứa các thông tin để tạo chứng chỉ ssl. thay đổi thông tin domain (CN, DNS.1, DNS.2) thành thông tin domain của bạn. Trên local muốn tạo domain thì ta có thể add domain vào file hosts và trỏ về ip `127.0.0.1`

```conf
[req]
default_bits = 2048
default_keyfile = oats.key
encrypt_key = no
utf8 = yes
distinguished_name = req_distinguished_name
x509_extensions = v3_req
prompt = no

[req_distinguished_name]
C = US
ST = Cary
L = Cary
O  = BigCompany
CN = *.nstack.org

[v3_req]
keyUsage = critical, digitalSignature, keyAgreement
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1 = nstack.org
DNS.2 = *.nstack.org
```

Tạo chứng chỉ ssl:

```bash
openssl req -x509 -sha256 -nodes -days 3650 -newkey rsa:2048 -keyout private.key -out certificate.crt  -config openssl.conf
```

Sau khi generate xong ta sẽ có 2 file `private.key` và `certificate.crt`

Chúng ta có thể cấu hình chứng chỉ vào nginx như sau:

```nginx
events {
    worker_connections 768;
}

http {
    gzip on;
    server {
        listen 80;
        server_name nstack.org;
        return 301 https://$host$request_uri;
    }

    server {
        listen 443 ssl;
        server_name nstack.org;

        ssl_certificate /etc/nginx/certs/certificate.crt;
        ssl_certificate_key /etc/nginx/certs/private.key;

        location / {
            # root /usr/share/nginx/html;
            # index index.html;
            proxy_pass http://host.docker.internal:2001;
        }
    }
}
```

Để chứng chỉ hoạt động được trên local cần thêm chứng chỉ vào `Trusted Root Certification Authorities` của hệ điều hành. Windows thì sử dụng `Computer account` để thêm chứng chỉ vào `Trusted Root Certification Authorities`
