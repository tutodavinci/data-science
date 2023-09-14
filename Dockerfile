
FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt /app/  # Copy the requirements.txt file separately

# Install project dependencies
RUN pip install -r requirements.txt

COPY . /app  # Copy the entire project after installing dependencies

# Expose a port to containers
EXPOSE 8080

# Command to run on server
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
