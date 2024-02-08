# Kubernetes Cheat Sheet

Kubernetes (k8s) is an open-source platform for automating container operations such as deployment, scaling, and management of containerized applications. It groups containers that make up an application into logical units for easy management and discovery.

## Key Concepts

- **Pod**: The smallest deployable unit created and managed by Kubernetes. A Pod represents a single instance of a running process in your cluster.
- **Service**: An abstract way to expose an application running on a set of Pods as a network service.
- **Deployment**: Describes the desired state for your deployed application. It allows you to define applications and their replicas, enabling Kubernetes to manage the application's state.
- **Namespace**: Used to separate resources within the same cluster. It's like having multiple virtual clusters within a single physical cluster.

## Basic Commands

### kubectl

`kubectl` is the command-line tool for interacting with the Kubernetes cluster.

- **Get information about various resources**
    ```bash
    kubectl get pods
    kubectl get services
    kubectl get deployments
    ```

- **Create a resource from a file**
    ```bash
    kubectl apply -f <filename>
    ```

- **Delete a resource**
    ```bash
    kubectl delete -f <filename>
    ```

- **Access the Kubernetes Dashboard (if installed)**
    ```bash
    kubectl proxy
    ```

- **Get detailed information about a resource**
    ```bash
    kubectl describe pods/<pod-name>
    ```

- **Accessing a Pod directly**
    ```bash
    kubectl exec -it <pod-name> -- /bin/bash
    ```

## Deploying an Application

1. **Create a Deployment**: This example creates a deployment named `my-app` using the image `my-app:1.0`.

    ```yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: my-app
    spec:
      replicas: 3
      selector:
        matchLabels:
          app: my-app
      template:
        metadata:
          labels:
            app: my-app
        spec:
          containers:
          - name: my-app
            image: my-app:1.0
            ports:
            - containerPort: 80
    ```

    Apply the deployment:

    ```bash
    kubectl apply -f deployment.yaml
    ```

2. **Create a Service**: To expose your application to the internet or internal network.

    ```yaml
    apiVersion: v1
    kind: Service
    metadata:
      name: my-service
    spec:
      type: LoadBalancer
      ports:
      - port: 80
        targetPort: 80
      selector:
        app: my-app
    ```

    Apply the service:

    ```bash
    kubectl apply -f service.yaml
    ```

## Namespaces

- **List Namespaces**
    ```bash
    kubectl get namespaces
    ```

- **Create a Namespace**
    ```bash
    kubectl create namespace <namespace-name>
    ```

- **Run Commands in a Specific Namespace**
    ```bash
    kubectl get pods --namespace=<namespace-name>
    ```

## Scaling Applications

- **Scale a Deployment**
    ```bash
    kubectl scale deployments/<deployment-name> --replicas=<num-replicas>
    ```

## Monitoring and Logging

- **Logs from a Pod**
    ```bash
    kubectl logs <pod-name>
    ```

- **Monitoring Cluster Components**
    ```bash
    kubectl top node
    kubectl top pod
    ```
