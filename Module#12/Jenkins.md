# Jenkins Installation Guide

## Update the package index

```
sudo apt update
```

## Install OpenJDK 11

```
sudo apt install openjdk-11-jdk -y
```

## Install Jenkins

Follow the commands listed here: [Jenkins Debian Package Repository](https://pkg.jenkins.io/debian-stable/)

## Managing Jenkins Service

### To start Jenkins

```
sudo systemctl start jenkins
```

### To enable Jenkins to start at boot

```
sudo systemctl enable jenkins
```

### To check the status of Jenkins

```
sudo systemctl status jenkins
```

## Initial Setup

Check if port 8080 is open, or change to a different port as needed.

### Retrieve the initial admin password

```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```