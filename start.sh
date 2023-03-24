#!/bin/bash
cd /app
gunicorn -b :5000 main:app
