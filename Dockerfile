# Set CentOS as base image
FROM centos:7

# Update repository CentOS and install EPEL repository
RUN yum -y update && \
    yum -y install epel-release

# Install Nginx 1.15 from EPEL repository
RUN yum -y install nginx

# Install PostgreSQL 11
RUN yum -y install postgresql-server

# Install Node.js 0.10.6
RUN curl -sL https://rpm.nodesource.com/setup_14.x | bash - && \
    yum -y install nodejs

# Setup web server using Express
RUN mkdir -p /opt/oss/app
COPY app.js /opt/oss/app/
COPY package.json /opt/oss/app/
WORKDIR /opt/oss/app
RUN npm install

# Setup Nginx config
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Create path for PostgreSQL backups
RUN mkdir -p /opt/oss/data/backups

# Expose ports 80 for Nginx and Express server
EXPOSE 80

# Start Nginx and PostgreSQL services, then start Express server using PM2
CMD ["/bin/bash", "-c", "systemctl start nginx && /usr/pgsql-11/bin/postgres -D /var/lib/pgsql/11/data > /var/log/pgsql.log 2>&1 & npm start"]
