#!/bin/bash

echo "🚀 Building Flutter web app..."
flutter build web

echo "📦 Deploying to Firebase..."
firebase deploy

echo "✅ Deployment complete!"
echo "🌐 Your resume is live at: https://nelson-resume.web.app" 