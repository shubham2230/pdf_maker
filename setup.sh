#!/bin/bash

echo "Installing dependencies..."
npm install

echo "Installing serve globally..."
npm install --global serve

echo "Creating assets directory..."
mkdir -p assets

echo "Copying PSPDFKit assets..."
cp -R ./node_modules/pspdfkit/dist/ ./assets/

echo "Setup complete! Run 'npm start' to start the server." 