
# Fixed Dockerfile

# Use the official Python image with version 3.9.7 as the base image
FROM python:3.9.7

# Set the working directory inside the container to /app
WORKDIR /app

# Copy all the contents of the current directory to the /app directory inside the container
COPY . /app

# Install the project dependencies by running pip install on the requirements.txt file
RUN pip install -r requirements.txt

# Copy the requirements.txt file to the /app directory inside the container
COPY requirements.txt requirements.txt

# Install the project dependencies again using pip install on the requirements.txt file
RUN pip install -r requirements.txt

# Copy all the other project files to the /app directory inside the container
COPY . .

# Expose port 8080 for the container to communicate with the outside world
EXPOSE 8080

# Set the command to run on the container when it starts
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
