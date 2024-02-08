### Playbook Example

Here's a simple playbook (`install_nginx.yml`) that installs nginx on a managed node:

```yaml
---
- name: Install nginx on Ubuntu
  hosts: webservers
  become: yes
  tasks:
    - name: Install nginx
      apt:
        name: nginx
        state: present
      notify: Start nginx

  handlers:
    - name: Start nginx
      service:
        name: nginx
        state: started
```

This playbook targets hosts under the `webservers` group, escalates privileges to install nginx using the `apt` module, and has a handler to start nginx if the installation task indicates a change.

### Task Example

A task is a single action performed on the managed nodes. Here’s an example task within a playbook to create a directory:

```yaml
tasks:
  - name: Create a directory
    file:
      path: /my_directory
      state: directory
```

### Module Example

Modules are the units of work in Ansible. Here's an example using the `file` module to create a directory, as shown in the task above. Another example is using the `copy` module to copy a file to a managed node:

```yaml
tasks:
  - name: Copy the file
    copy:
      src: /my_local_file.txt
      dest: /remote_destination/my_file.txt
```

### Variables (Vars) Example

Variables can be defined in various places. Here's an example of using variables within a playbook:

```yaml
vars:
  webserver_port: 8080
  webserver_package: nginx

tasks:
  - name: Install a web server
    apt:
      name: "{{ webserver_package }}"
      state: present
```

Variables `webserver_port` and `webserver_package` are used to make the playbook more dynamic and configurable.

### Handlers Example

Handlers are tasks that run in response to a notification from another task. Here’s an example where a handler is triggered to restart nginx:

```yaml
handlers:
  - name: Restart nginx
    service:
      name: nginx
      state: restarted
```

This handler would be notified by a task if, for example, a configuration file has changed.

### Roles Example

Roles allow you to organize tasks, handlers, files, templates, and variables into a coherent structure. Here’s an example directory structure for a role called `nginx`:

```
roles/
  nginx/
    tasks/
      main.yml
    handlers/
      main.yml
    files/
      nginx.conf
    templates/
      index.html.j2
    vars/
      main.yml
```

Each role has directories for different types of files. The `main.yml` file in each directory contains relevant content. For example, `tasks/main.yml` might include tasks for installing and configuring nginx, while `handlers/main.yml` could define handlers to restart nginx when needed.

These examples illustrate the fundamental concepts of Ansible playbooks, tasks, modules, variables, handlers, and roles, providing a foundation for automating a wide range of IT processes efficiently.