
FROM python:3.9-slim  
WORKDIR /app
COPY . /app  

# Install project dependencies
RUN pip install -r requirements.txt

# Expose a port to containers
EXPOSE 8080 

# Command to run on server
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
