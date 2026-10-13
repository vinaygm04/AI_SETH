---
title: StethAI Backend
emoji: 🩺
colorFrom: blue
colorTo: cyan
sdk: docker
app_port: 7860
pinned: false
---

# StethAI ML Backend

FastAPI backend for heart sound classification using TensorFlow/Keras.

## API Endpoints

- `POST /api/predict/heart` — Upload audio and get murmur detection result
- `GET /docs` — Interactive API docs (Swagger UI)

## Environment Variables (set as HF Secrets)

- `SUPABASE_URL`
- `SUPABASE_SERVICE_ROLE_KEY`
