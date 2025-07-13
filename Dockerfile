# use python 3.9 slim image as base image
FROM python:3.9-slim

# Install netcat for wait-for-it script
RUN apt-get update && apt-get install -y netcat-traditional && rm -rf /var/lib/apt/lists/*

# set working directory in the container
WORKDIR /app

# copy all the requirements to perform better caching
COPY requirements.txt .

# then run and install all of the dependencies which lie inside requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# copy the rest of the application code to the container
COPY . .

# Make wait-for-it script executable
RUN chmod +x wait-for-it.sh

# now expose the port where FastAPI is running on
EXPOSE 8000

# command to run the application using uvicorn like (uvicorn main:app --host)
CMD ["uvicorn","main:app", "--host", "0.0.0.0", "--port", "8000"]
