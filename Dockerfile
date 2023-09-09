# Use an official Node.js runtime as a base image
FROM node:16-alpine as development

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the container
COPY package*.json .

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Run the application
RUN npm run build

# Copy to another container
FROM node:16-alpine as production

# Set arguments
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the container
COPY package*.json .

# Install dependencies
RUN npm ci install --only=production

# Copy form stage
COPY --from=devlepment /usr/src/app/build ./build

# Run the application
CMD ["node", "build/index.js"]