# Use an official Node.js runtime as a base image
FROM node:14

# Install nodemon and typescript globally
RUN npm install -g nodemon typescript

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build TypeScript code to JavaScript
RUN npx tsc

# Expose the port your application listens on (adjust as needed)
EXPOSE 3000

# Define the command to run your application
CMD [ "npm", "run", "dev"]
