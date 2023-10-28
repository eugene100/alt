# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory to /app
WORKDIR /simpletime

# Copy the current directory contents into the container at /app
COPY . /simpletime

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run simpletime.py when the container launches
CMD ["python", "simpletime.py"]
