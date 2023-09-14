
# Fixed Dockerfile:

# Changed the base image to a newer version of python
FROM python:3.9.7

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app    

# Added a slash (/) at the beginning of "requirements.txt" to specify the absolute path
RUN pip install -r /app/requirements.txt

# Set the default command to run when a container is created
CMD ["python", "app.py"]
