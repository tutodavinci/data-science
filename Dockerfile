
# Change the base image to a more complete Python 3.9 image
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt /app/

# Install project dependencies
RUN pip install -r requirements.txt

# Copy the entire project to the container
COPY . /app/

# Expose port 8080 to the outside world
EXPOSE 8080

# Define the command to run the server
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]

