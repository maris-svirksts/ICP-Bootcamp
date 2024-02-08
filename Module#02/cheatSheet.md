# Git Cheat Sheet

## Configuration

Set up your user name and email address before starting to work on your projects.

- **Set your username:**
  ```
  git config --global user.name "Your Name"
  ```
- **Set your email address:**
  ```
  git config --global user.email "your_email@example.com"
  ```

## Creating and Cloning Repositories

Start a new repository or clone an existing one.

- **Create a new local repository:**
  ```
  git init
  ```
- **Clone an existing repository:**
  ```
  git clone https://github.com/username/repository.git
  ```

## Basic Snapshotting

Commands for working with changes.

- **Check status:**
  ```
  git status
  ```
- **Add changes to stage/index:**
  ```
  git add <filename>
  git add .
  ```
- **Commit your staged content as a new commit snapshot:**
  ```
  git commit -m "Your message about the commit"
  ```

## Branching and Merging

Manage branches and integrate the changes.

- **List all local branches:**
  ```
  git branch
  ```
- **Create a new branch:**
  ```
  git branch <branchname>
  ```
- **Switch to a branch:**
  ```
  git checkout <branchname>
  ```
- **Create a new branch and switch to it:**
  ```
  git checkout -b <branchname>
  ```
- **Merge a branch into the active one:**
  ```
  git merge <branchname>
  ```
- **Delete a branch:**
  ```
  git branch -d <branchname>
  ```

## Sharing and Updating Projects

Commands to update and publish your project.

- **Fetch and merge changes on the remote server to your working directory:**
  ```
  git pull
  ```
- **Push the branch to your remote repository:**
  ```
  git push origin <branchname>
  ```
- **Push all branches to your remote repository:**
  ```
  git push --all origin
  ```

## Inspection and Comparison

Examine logs and compare versions.

- **Show the commit history:**
  ```
  git log
  ```
- **Show the commit history including changes:**
  ```
  git log -p
  ```
- **Compare two branches:**
  ```
  git diff <branchone> <branchtwo>
  ```

## Undoing Changes

Revert and undo actions in your repository.

- **Undo changes in a file to the last commit:**
  ```
  git checkout -- <filename>
  ```
- **Revert a commit by creating a new commit with contrary changes:**
  ```
  git revert <commit>
  ```
- **Reset your HEAD pointer to a previous state and discard all changes since then:**
  ```
  git reset --hard <commit>
  ```
