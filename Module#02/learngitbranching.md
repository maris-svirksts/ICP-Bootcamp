# List of git commands required to fulfill tasks on learngitbranching.js.org

![Main](Main.jpg)

![Remote](Remote.jpg)

## Introduction Sequence

### Introduction to Git Commits
- `git commit`
- `git commit`

### Branching in Git
- `git checkout -b bugFix`

### Merging in Git
- `git commit`
- `git branch bugFix`
- `git checkout C1`
- `git commit`

### Rebase Introduction
- `git branch bugFix`
- `git checkout bugFix`
- `git commit`
- `git checkout main`
- `git commit`
- `git merge bugFix`

## Ramping Up

### Detach yo' HEAD
- `git checkout C4`

### Relative Refs
- `git checkout C3`

### Relative Refs #2 (~)
- `git branch -f main C6`
- `git branch -f bugFix C0`
- `git checkout C1`

### Reversing Changes in Git
- `git checkout C2`
- `git revert HEAD`
- `git branch -f pushed c2'`
- `git checkout C3`
- `git branch -f local C1`

## Moving Work Around

### Cherry-pick Intro
- `git cherry-pick C3 C4 C7`

### Interactive Rebase Intro
- `git rebase -i C1`

## A Mixed Bag

### Grabbing Just 1 Commit
- `git rebase -i C1`
- `git branch -f main C4'`

### Juggling Commits
- `git rebase -i caption^^`
- `git commit --amend`
- `git rebase -i caption^^`
- `git branch main caption`

### Juggling Commits #2
- `git checkout main`
- `git cherry-pick C2`
- `git commit --amend`
- `git cherry-pick C3`

### Git Tags
- `git tag v1 C2`
- `git tag v0 C1`
- `git checkout C2`

### Git Describe
- `git describe C3`
- `git commit`

## Advanced Topics

### Rebasing over 9000 times
- `git rebase main bugFix`
- `git rebase bugFix side`
- `git rebase side another`
- `git rebase another main`

### Multiple parents
- `git checkout HEAD~^2~`
- `git branch bugWork`
- `git checkout main`

### Branch Spaghetti
- `git checkout one`
- `git cherry-pick C4 C3 C2`
- `git checkout two`
- `git cherry-pick C5 C4 C3 C2`
- `git branch -f three C2`

## Push & Pull -- Git Remotes!

### Clone Intro
- `git clone`

### Remote Branches
- `git commit`
- `git checkout C1`
- `git commit`

### Git Fetchin'
- `git fetch`

### Git Pullin'
- `git pull`

### Faking Teamwork
- `git clone`
- `git fakeTeamwork 2`
- `git commit`
- `git push`

### Git Pushin'
- `git commit`
- `git commit`
- `git push`

### Diverged History
- `git clone`
- `git fakeTeamwork 1`
- `git commit`
- `git pull --rebase`
- `git push`

### Locked Main
- `git branch feature`
- `git branch -f main C1`
- `git reset o/main`
- `git push origin feature`
- `git checkout feature`

## To Origin And Beyond -- Advanced Git Remotes!

### Push Main!
- `git fetch`
- `git rebase o/main side1`
- `git rebase side1 side2`
- `git rebase side2 side3`
- `git rebase side3 main`
- `git push`

### Merging with remotes
- `git checkout main`
- `git pull`
- `git merge side1`
- `git merge side2`
- `git merge side3`
- `git push`

### Remote Tracking
- `git checkout -b side o/main`
- `git commit`
- `git fetch`
- `git rebase o/main`
- `git push`

### Git push arguments
- `git push origin main`
- `git push origin foo`

### Git push arguments -- Expanded!
- `git push origin main^:foo`
- `git push origin foo:main`

### Fetch arguments
- `git fetch origin main^:foo`
- `git fetch origin foo:main`
- `git checkout foo`
- `git merge main`

### Source of nothing
- `git push origin :foo`
- `git fetch origin :bar`

### Pull arguments
- `git pull origin bar:foo`
- `git pull origin main:side`

## Additional Information
- I used ChatGPT 4 to add Markup language code. The commands and overall logic is my own.
