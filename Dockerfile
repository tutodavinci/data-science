
#FROM python:3.9.7
FROM python:3.9-slim  # Changed base image to a slimmer version of Python to reduce container size
WORKDIR /app
COPY . /app
#COPY requirements.txt requirements.txt   # Fixed typo in target path

# Install project dependencies
RUN pip install -r requirements.txt

# Remove unnecessary "COPY . ." command since the previous "COPY . /app" command already copied all files

# Expose a port to containersPOSE
EX 8080

# Command to run on server
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
