# Use a lightweight Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy dependency list and install them
COPY Requirement.txt .
RUN pip install --no-cache-dir -r Requirement.txt

# Copy the rest of the code
COPY . .

# Run the app
CMD ["python", "app.py"]
