# Git Cheat Sheet

## Configuration

Configure your Git environment.

- **Set your username:**
  ```
  git config --global user.name "Your Name"
  ```
- **Set your email address:**
  ```
  git config --global user.email "your_email@example.com"
  ```

## Creating and Cloning Repositories

Start with a new or an existing repository.

- **Create a new local repository:**
  ```
  git init
  ```
- **Clone an existing repository:**
  ```
  git clone https://github.com/username/repository.git
  ```

## Basic Snapshotting

Work with changes and snapshots.

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

Manage and integrate branches.

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

Update and share your project with others.

- **Fetch changes from the remote repository:**
  ```
  git fetch origin
  ```
  This command downloads new data from the remote repository without integrating any of the new data into your working files. It's a good way to see what others have done before integrating changes.

- **Merge fetched changes:**
  ```
  git merge origin/<branchname>
  ```
  After fetching, use this command to merge the remote changes into your current branch.

- **Fetch and merge changes in one step:**
  ```
  git pull
  ```
  This command is a combination of `git fetch` followed by `git merge`. It fetches changes from the remote repository and immediately merges them.

- **Push the branch to your remote repository:**
  ```
  git push origin <branchname>
  ```
- **Push all branches to your remote repository:**
  ```
  git push --all origin
  ```

## Inspection and Comparison

Inspect and compare different versions.

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

Reverse actions and undo changes.

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
