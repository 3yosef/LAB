FROM haproxy:latest

# Install SSH server
RUN apt-get update && apt-get install -y openssh-server

# Ensure /root/.ssh directory exists and has correct permissions
RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh

# Set root password to "joe123"
RUN echo 'root:joe123' | chpasswd

# Copy SSL certificates (assuming you already have these files in the project)
COPY cert.pem /etc/ssl/certs/cert.pem
COPY server.crt /etc/ssl/certs/server.crt
COPY server.key /etc/ssl/private/server.key

# Expose necessary ports (HTTP, HTTPS, and SSH)
EXPOSE 22 8080 8443

# Start both SSH server and HAProxy
CMD service ssh start && haproxy -f /usr/local/etc/haproxy/haproxy.cfg

