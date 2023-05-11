FROM python:3.9-slim-buster

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install django-environ
RUN pip install python-dotenv
RUN pip install djongo

COPY . .
RUN rm -rf .env

EXPOSE 5004

CMD ["python", "manage.py", "runserver", "0.0.0.0:5004"]