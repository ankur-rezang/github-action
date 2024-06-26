FROM ubuntu

WORKDIR /app

COPY requirements.txt /app
COPY python-web-app/devops /app/python-web-app/devops

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip install -r requirements.txt

WORKDIR /app/python-web-app/devops

ENTRYPOINT ["python3"]
CMD ["manage.py", "runserver", "0.0.0.0:8000"]
