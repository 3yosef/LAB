# **Load Balancer with High availability Backend Applications**

## **Description**

This project sets up a secure HAProxy-based load balancer using **Docker** containers and **Terraform** for automated infrastructure management. The HAProxy load balancer listens for HTTPS traffic and forwards it to two backend application containers running a simple NGINX-based application. The setup also includes a visual architecture diagram generated with Python's **Diagrams** library.

The load balancer is accessible via:
- **HTTPS**: [https://localhost:8443](https://localhost:8443)
- **SSH**: `ssh root@localhost -p 2222`

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
├── yosef_lab.png           # Generated architecture diagram
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
  - **SSH**: `ssh root@localhost -p 2222`
- **Backend Applications**:
  - `hello-app-1`: Internal IP `192.168.1.11`
  - `hello-app-2`: Internal IP `192.168.1.22`

---

### **4. Generate the Architecture Diagram**
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

## **Destroying the Infrastructure**
To destroy the infrastructure and clean up the Docker containers and network:
```bash
terraform destroy
```

---

