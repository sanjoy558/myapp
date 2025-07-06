# Use official Node.js image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy files
COPY . .

# Install dependencies
RUN npm install

# Expose app port
EXPOSE 3000

# Start app
CMD ["npm", "start"]
