# Use a Node.js image with a version compatible with React Native
FROM node:18

# Install necessary tools
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set up the working directory in the container
WORKDIR /usr/src/app

# Copy the React Native app from the host machine to the container
COPY app ./app

# Set the working directory to the app directory
WORKDIR /usr/src/app/app

# Install project dependencies
RUN npm install

# Expose port 8081 for Metro Bundler
EXPOSE 8081

# Start the React Native Metro Bundler
CMD ["npm", "start"]