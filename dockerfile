FROM node:20-alpine

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm ci --omit=dev

# Copy application source
COPY . .

# Run as non-root user
USER node

# Express will listen on this port
EXPOSE 3000

# Express Generator server
CMD ["node", "app.js"]