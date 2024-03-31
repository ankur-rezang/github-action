FROM ubuntu

WORKDIR /app

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip install -r requirements.txt && \
    # cd python-web-app

# Copy requirements.txt and install dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
    
# Copy the application code
COPY python-web-app /app/python-web-app

# Set the entrypoint and default command
ENTRYPOINT ["python3"]
CMD ["python-web-app/manage.py", "runserver", "0.0.0.0:8000"]
