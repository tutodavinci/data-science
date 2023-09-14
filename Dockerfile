
FROM python:3.7
COPY . /app        # Added current directory (source context) to be copied to /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 80
CMD gunicorn --workers=4 --bind 0.0.0:80 app:app
