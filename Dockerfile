FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    libsndfile1 \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the full repo (includes the .keras model file)
RUN git clone https://github.com/vinaygm04/AI_SETH .

# Install Python dependencies
RUN pip install --no-cache-dir -r backend/requirements.txt

# Set working directory to backend
WORKDIR /app/backend

# Expose HuggingFace Spaces default port
EXPOSE 7860

# Set default env vars (will be overridden by HF Secrets)
ENV SUPABASE_URL=""
ENV SUPABASE_SERVICE_ROLE_KEY=""

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "7860"]
