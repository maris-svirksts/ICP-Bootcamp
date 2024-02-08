# Amazon Simple Queue Service (SQS)

Amazon Simple Queue Service (SQS) is a fully managed message queuing service that enables you to decouple and scale microservices, distributed systems, and serverless applications. SQS eliminates the complexity and overhead associated with managing and operating message-oriented middleware and empowers developers to focus on differentiating work.

## Key Features

- **Fully Managed**: Amazon manages all ongoing operations and underlying infrastructure needed to provide a highly available and scalable message queuing service.
- **Two types of queues**: Standard queues offer maximum throughput, best-effort ordering, and at-least-once delivery. FIFO queues are designed to guarantee that messages are processed exactly once, in the exact order that they are sent.
- **Security**: SQS provides secure messaging by offering standard encryption over the network and the option to encrypt messages at rest.
- **Integration**: Easy integration with AWS Lambda, Amazon SNS, and other AWS services for comprehensive solutions.

## AWS CLI Commands for SQS

Before running AWS CLI commands, ensure you have the AWS CLI installed and configured with the necessary access permissions.

### Create a Queue

```bash
aws sqs create-queue --queue-name MyQueue
```

For FIFO queue, append `.fifo` to the queue name and set the `FifoQueue` attribute:

```bash
aws sqs create-queue --queue-name MyQueue.fifo --attributes FifoQueue=true
```

### List Queues

```bash
aws sqs list-queues
```

### Send a Message

For a standard queue:

```bash
aws sqs send-message --queue-url <QueueURL> --message-body "Hello, SQS!"
```

For a FIFO queue, you must include the `MessageGroupId`:

```bash
aws sqs send-message --queue-url <QueueURL> --message-body "Hello, SQS!" --message-group-id MyMessageGroupId
```

### Receive Messages

```bash
aws sqs receive-message --queue-url <QueueURL>
```

### Delete a Message

After processing a message, you should delete it from the queue:

```bash
aws sqs delete-message --queue-url <QueueURL> --receipt-handle <ReceiptHandle>
```

### Delete a Queue

```bash
aws sqs delete-queue --queue-url <QueueURL>
```

### Set Queue Attributes

To update the attributes of a queue:

```bash
aws sqs set-queue-attributes --queue-url <QueueURL> --attributes '{"VisibilityTimeout":"60"}'
```

## Note

- `<QueueURL>`: Replace this with the actual URL of your SQS queue.
- `<ReceiptHandle>`: This is provided when you receive a message from the queue. It's used to reference the message for deletion.
