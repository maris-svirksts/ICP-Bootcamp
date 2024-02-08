# Ansible Overview

Ansible is an open-source automation tool, or platform, used for IT tasks such as configuration management, application deployment, intra-service orchestration, and provisioning. It aims to provide a simple, yet powerful, automation engine that operates in a secure and predictable manner.

## Common Terms

- **Control Node**: The machine where Ansible is installed and runs playbooks. It manages other nodes over SSH.
- **Managed Node**: The servers (nodes) being managed by the control node. Ansible does not need to be installed on managed nodes.
- **Playbook**: A YAML file containing a list of tasks to be executed on managed nodes. Playbooks can include variables, tasks, and handlers.
- **Task**: A block that defines a single procedure to be executed, e.g., installing a package.
- **Module**: Reusable, standalone scripts that Ansible runs on your behalf. They can do anything from interacting with external systems to serving files to managed nodes.
- **Vars (Variables)**: Used to deal with dynamic data in playbooks. They can be defined in various places, including playbooks, inventory, and files.
- **Handlers**: Special tasks that only run when notified by another task. If a task signals a change (`notify`), the corresponding handler is triggered.
- **Roles**: A way to group multiple tasks, handlers, files, templates, and variables into a clear directory structure. Roles facilitate reuse and redistribution.
  
## Jinja2

Jinja2 is a modern and designer-friendly templating language for Python, modeled after Django’s templates. In Ansible, Jinja2 is used for creating dynamic expressions and accessing variables.

## YAML

YAML (YAML Ain't Markup Language) is a human-readable data serialization standard that can be used in conjunction with all programming languages and is often used to write playbooks in Ansible.

## Ansible Vault

Ansible Vault is a feature that allows users to encrypt variables and files to keep sensitive data secure. You can use `ansible-vault` to create, edit, and manage encrypted files.

## Configuration Management

Configuration management is the process of maintaining computer systems, servers, and software in a desired, consistent state. It's used to automate the provisioning and management of infrastructure, ensuring that all systems are configured correctly and identically.

### Pros of Using Configuration Management

- **Consistency**: Ensures all systems are configured to the desired state and prevents drift.
- **Automation**: Reduces manual tasks, speeding up the provisioning and deployment processes.
- **Version Control**: Changes to configurations are tracked, allowing for easy rollback and understanding of changes over time.
- **Efficiency**: Improves operational efficiency by reducing configuration errors and downtime.

## Commonly Used Modules

- **copy**: Copies files to remote locations.
- **file**: Sets attributes of files, such as permissions.
- **apt**: Manages packages with the `apt` package manager (specifically for Debian/Ubuntu).
- **service**: Manages services, ensuring they are started or stopped.

## Executing Ansible Playbooks and Ad-Hoc Commands

### Playbooks

To execute an Ansible playbook, use the `ansible-playbook` command followed by the playbook file:

```bash
ansible-playbook playbook.yml
```

### Ad-Hoc Commands

For executing tasks directly without a playbook, use the `ansible` command. For example, to ping all managed nodes:

```bash
ansible all -m ping
```

This command checks the connection to all nodes defined in the Ansible inventory.

Ansible's simplicity, along with its power and versatility for automating IT tasks, makes it a popular choice for configuration management and application deployment across diverse environments.