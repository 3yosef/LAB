Your documentation is clear and well-organized. Here's the **revised final version** with the corrections and additional details you requested:

---

# **Load Balancer with HA Backend Applications**

## **Description**

This project sets up a secure HAProxy-based load balancer using **Docker** containers and **Terraform** for automated infrastructure management. The HAProxy load balancer listens for HTTPS traffic and forwards it to two backend application containers running a simple NGINX-based application. The setup also includes a visual architecture diagram generated with Python's **Diagrams** library.

The load balancer is accessible via:
- **HTTPS**: [https://localhost:8443](https://localhost:8443)
- **SSH**: `ssh root@localhost -p 2222` (Password: `joe123`)

## **Features**
- **SSL Termination**: HAProxy handles HTTPS traffic on port `8443` using a custom SSL certificate.
- **Load Balancing**: HAProxy uses round-robin load balancing to distribute traffic between two backend containers.
- **Docker Containers**: All components are containerized using Docker.
- **Infrastructure as Code**: The setup is fully automated with Terraform.
- **Architecture Diagram**: A Python script generates a visual diagram of the infrastructure.

---

## **Prerequisites**

Before you begin, ensure that you have the following tools installed on your system:

- [Docker](https://www.docker.com/get-started) (for containerizing the application)
- [Terraform](https://www.terraform.io/downloads.html) (for infrastructure management)
- [Python](https://www.python.org/downloads/) (for generating the architecture diagram)

---

## **Project Structure**
```bash
.
├── Dockerfile                # Custom HAProxy image build file
├── diagram.py                # Python script for generating architecture diagram
├── haproxy.cfg               # HAProxy configuration file
├── lab_diagram.png           # Generated architecture diagram
├── main.tf                   # Terraform configuration for container and network setup
├── cert.pem                  # SSL certificate file for HTTPS
├── server.crt                # SSL certificate for the load balancer
├── server.key                # Private key file for SSL
```

---

## **Setup Instructions**

### **1. Clone the Repository**
Clone this repository to your local machine using the following command:
```bash
git clone https://github.com/3yosef/LAB.git
cd LAB
```

### **2. Set Up the Infrastructure with Terraform**
Terraform will create the Docker containers and network for you. To begin, initialize Terraform and apply the configuration:

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Apply the Terraform configuration:
   ```bash
   terraform apply
   ```
   - Terraform will prompt you for confirmation to create the infrastructure. Type `yes` to proceed.

---

### **3. Verify the Setup**

Once Terraform completes, you should have the following components running:
- **HAProxy Load Balancer**:
  - **HTTPS**: [https://localhost:8443](https://localhost:8443) (SSL-secured)
  - **SSH**: `ssh root@localhost -p 2222` (Password: `joe123`)
- **Backend Applications**:
  - `hello-app-1`: Internal IP `192.168.1.11`
  - `hello-app-2`: Internal IP `192.168.1.22`

To verify:

- **HTTPS**: Visit `https://localhost:8443` in your browser. Traffic will be routed to one of the backend applications in a round-robin manner.
- **SSH**: Use the command below to SSH into the HAProxy container:
  ```bash
  ssh root@localhost -p 2222
  ```
  Enter the password: `joe123`.

---

### **4. Generate the Architecture Diagram (Optional)**
To visualize the infrastructure architecture, run the Python script `diagram.py`:

1. Ensure the `diagrams` library is installed:
   ```bash
   pip install diagrams
   ```

2. Generate the diagram:
   ```bash
   python3 diagram.py
   ```
   The output will be saved as `lab_diagram.png` in the current directory.

---

## **Usage**
Once the infrastructure is up and running:
1. **HTTPS Traffic**: Clients send requests to the HAProxy load balancer at `https://localhost:8443`.
2. **Load Balancing**: HAProxy forwards traffic to one of the backend applications (`hello-app-1` or `hello-app-2`) using the round-robin algorithm.
3. **Health Checks**: HAProxy monitors the backend applications' health and routes traffic to healthy instances.

---

## **Destroying the Infrastructure**
To destroy the infrastructure and clean up the Docker containers and network:
```bash
terraform destroy
```

---

This version ensures the following:
- HTTPS and SSH access are documented clearly.
- Users are informed about both backend applications.
- Instructions for verification and diagram generation are detailed. 

Let me know if you need any additional adjustments!
```
Terraform will prompt for confirmation before removing the resources. Type `yes` to proceed.

---
