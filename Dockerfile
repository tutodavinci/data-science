
FROM python:3.9-slim  # Changed base image to a slimmer version of Python to reduce container size
WORKDIR /app
COPY . /app  # Fixed typo with source path

# Install project dependencies
RUN pip install -r requirements.txt

# Expose a port to containers
EXPOSE 8080  # Fixed typo by replacing EX with EXPOSE

# Command to run on server
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
