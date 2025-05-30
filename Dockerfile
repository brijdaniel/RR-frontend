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

# Install Expo globally (optional)
RUN npm install expo
RUN npm install -g expo-cli
RUN npm install --global @expo/ngrok@^4.1.0

# Expose ports for Expo
EXPOSE 19000 19001 19002

# Start Expo CLI
CMD ["npx", "expo", "start", "--tunnel"]