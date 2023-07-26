# Express-Webserver  
## Goal  
- Setup simple hello-world node.js deploy on Docker container  
## Steps:  
1. Create app.js and package.json.  
  - App.js is the main module in a Node.js project. This file is used to initialize and set up the web application using a specific framework or library. App.js contains code to create a simple Express server that responds with the message "Hello World!" when a request is made to the root URL ('/').  
  - Package.json is a configuration file for a Node.js project. It contains information about the project, the dependencies required by the project, and various scripts that can be executed using npm.  
2. Create Nginx directory configuration default.conf to forward traffic from port 80 to Express Webserver using port 3000.  
3. Create Dockerfile to build Docker image. This Dockerfile is created in one directory with app.js and package.json. You can use the following command to build dockerfile into docker image
```bash
docker build -t pandudw/app-js . 
```  
3. Build Docker container using latest image with following command
```bash 
docker container run -dit p 80:80 --name app pandudw/app-js
```
