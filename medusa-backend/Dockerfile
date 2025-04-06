FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy project files into the container
COPY . .

# Install dependencies
RUN npm install

# Expose the Medusa port
EXPOSE 9000

# Run the Medusa server
CMD ["npm", "run", "start"]




