
FROM python:3.9.7
WORKDIR /app
COPY . /app
COPY requirements.txt /app/requirements.txt   # Fixed typo in target path

# Install project dependencies
RUN pip install -r requirements.txt

# Remove unnecessary "COPY . ." command

# Expose a port to containers
EXPOSE 8080

# Command to run on server
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
