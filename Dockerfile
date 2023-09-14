
FROM python:3.9.7
WORKDIR /app
COPY . /app        
RUN pip install -r requirements.txt
CMD ["python", "app.py"]
