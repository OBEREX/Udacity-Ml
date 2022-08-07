FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy requirement to working directory
COPY requirements.txt requirements.txt

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install  --trusted-host pypi.python.org -r requirements.txt

## Step 4:
# Copy source code to working directory
COPY . .
## Step 5:
# Expose port 80
EXPOSE  8080 
## Step 6:
# Run app.py at container launch
CMD [ "python", "./app.py" ]

