# Kubernetes (K8s) Architecture and Features

## K8s Architecture

Kubernetes follows a master-slave architecture. The master node controls and manages the slave nodes, where the actual workloads (containers) run. 

### Components of the Master Node

- **API Server**: Serves as the frontend to the cluster, exposing the Kubernetes API. It's the only component that directly interacts with the Kubernetes cluster.
- **etcd**: A distributed key-value store used to store all cluster data, ensuring data consistency across the cluster.
- **Scheduler**: Responsible for scheduling pods onto nodes based on resource availability and other constraints.
- **Controller Manager**: Runs controller processes, handling node failure, replicating components, maintaining the correct number of pods, etc.

### Components of the Worker Node

- **Kubelet**: An agent that runs on each node in the cluster, ensuring containers are running in a Pod.
- **Kube-Proxy**: Maintains network rules on nodes. These network rules allow network communication to your Pods from network sessions inside or outside of your cluster.
- **Container Runtime**: The software responsible for running containers, with Docker being the most popular.

## Features of the Components

- **API Server**: Central management entity, handles user inputs, and internal system components.
- **etcd**: Reliability and storage consistency, crucial for cluster state and configuration.
- **Scheduler**: Efficient and automated workload distribution, optimizes resource utilization.
- **Controller Manager**: System resilience and self-healing, ensures desired state of the cluster.
- **Kubelet**: Node-level management, communicates with the master to run containers.
- **Kube-Proxy**: Network connectivity and load balancing for services.

## Deploying Workloads

### Pods

Pods are the smallest deployable units in Kubernetes that you can create or manage.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
  - name: my-container
    image: nginx
```

### Services

Services define a logical set of Pods and a policy to access them.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app: MyApp
  ports:
    - protocol: TCP
      port: 80
      targetPort: 9376
```

### ReplicaSets

ReplicaSets ensure that a specified number of replica Pods are running at any given time.

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: my-replicaset
spec:
  replicas: 3
  selector:
    matchLabels:
      app: MyApp
  template:
    metadata:
      labels:
        app: MyApp
    spec:
      containers:
      - name: my-container
        image: nginx
```

### Deployments

Deployments provide declarative updates to Pods and ReplicaSets.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: MyApp
  template:
    metadata:
      labels:
        app: MyApp
    spec:
      containers:
      - name: my-container
        image: nginx
```

## Scheduling Nodes

The scheduler assigns Pods to nodes based on resource availability, constraints, affinity/anti-affinity specifications, etc.

## Kubernetes Networking

Kubernetes networking addresses four primary concerns:

- Containers within a Pod communicate without using networking (`localhost`).
- Pod-to-Pod communication across nodes.
- Pod-to-Service communication within the cluster.
- External to Service communication into the cluster.

## Storage Backends

Kubernetes supports several storage backends for persistent storage:

- **Volumes**: Tied to the lifecycle of a Pod.
- **Persistent Volumes (PV) and Persistent Volume Claims (PVC)**: Abstracts storage provisioning and consumption.
- **Storage Classes**: Dynamic volume provisioning based on the type of storage.

## Troubleshooting Problems

Common steps include:

- Checking Pod and container logs.
- Verifying Pod status (`kubectl get pods`).
- Inspecting events in the namespace (`kubectl get events`).
- Using `kubectl describe` to get more details about a specific resource.
- Checking network policies and security groups.
- Verifying storage and persistent volume claims.
