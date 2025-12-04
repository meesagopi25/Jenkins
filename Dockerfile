FROM python:3.11-slim

WORKDIR /app

# Install system packages if needed
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app source
COPY . .

ENV PYTHONUNBUFFERED=1
EXPOSE 5000

CMD ["python", "app.py"]

