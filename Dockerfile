FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libsndfile1 \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy requirements first (separate layer for caching)
COPY backend/requirements.txt ./backend/requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir -r backend/requirements.txt

# Copy backend source and model
COPY backend/ ./backend/
COPY shared/ ./shared/

# Set working directory to backend
WORKDIR /app/backend

ENV SUPABASE_URL=""
ENV SUPABASE_SERVICE_ROLE_KEY=""
ENV PORT=8000

CMD uvicorn main:app --host 0.0.0.0 --port $PORT
