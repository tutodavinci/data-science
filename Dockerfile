
FROM python:3.9.7
COPY . /app        
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 80

#CMD ['python3', 'app.py']
CMD ["python", "app.py"]
