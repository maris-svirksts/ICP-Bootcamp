# Ansible Installation and Basic Tasks

This guide outlines the steps to install Ansible on your system and demonstrates several basic Ansible tasks for configuration management and automation.

## Installing Ansible

Follow these steps to install Ansible on an Ubuntu system:

1. Add the Ansible PPA to your system:
   ```bash
   sudo -E apt-add-repository ppa:ansible/ansible
   ```

2. Install Ansible using `apt`:
   ```bash
   sudo apt install ansible
   ```

3. Update the PPA and ensure it's up to date:
   ```bash
   sudo add-apt-repository --yes --update ppa:ansible/ansible
   ```

4. Verify the installation by checking the Ansible version:
   ```bash
   ansible --version
   ```

## Running a Simple Playbook

To execute a playbook, such as `lamp.yml`, use the following command:

```bash
ansible-playbook lamp.yml
```

## Basic Ansible Tasks

Here are some basic tasks you can perform with Ansible:

- **Task 1**: Create a new file named `t1.txt` on the hosts:
  ```bash
  ansible hosts -a "touch t1.txt"
  ```

- **Task 2**: Copy the file `install_ansible.sh` to the remote hosts:
  ```bash
  ansible hosts -m copy -a "src=install_ansible.sh dest=."
  ```

- **Task 3**: Restart the Apache2 service on the remote hosts:
  ```bash
  ansible hosts -m service -a "name=apache2 state=restarted" --become
  ```

- **Task 4**: Install the `tree` package on the remote hosts:
  ```bash
  ansible hosts -m apt -a "name=tree state=present" --become
  ```

- **Task 5**: Remove the `tree` package from the remote hosts:
  ```bash
  ansible hosts -m apt -a "name=tree state=absent" --become
  ```

- **Task 6**: Reboot the remote hosts:
  ```bash
  ansible hosts -m reboot --become
  ```

## Note on Ad-hoc Commands and Variable Interpolation

When running the following ad-hoc command with Ansible:

```bash
ansible hosts --become -m command -a "scp ./install_ansible.sh  ubuntu@{{ inventory_hostname }}:/home/ubuntu/t2" -vvv -i /etc/ansible/hosts
```

This command will not work as expected because the `{{ inventory_hostname }}` variable is used within double quotes. In ad-hoc commands, variable interpolation like this doesn't work as expected because the ad-hoc command context doesn't process these variables.
