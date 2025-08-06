
# 🧰 Git Basics – Commonly Used Commands

This file contains a quick and clear reference of essential Git commands for version controlling your project.

---

## 🔧 Git Initialization

```bash
git init
```
Initializes a new Git repository in your current directory. It creates a `.git` folder that tracks changes in your project.

---

## 🔁 Cloning a Repository

```bash
git clone <repo-url>
```
Clones an existing remote Git repository (usually from GitHub) into your local machine.

Example:
```bash
git clone https://github.com/username/repo-name.git
```

---

## 📋 Checking File Status

```bash
git status
```
Shows the current status of files in your working directory:
- Files that are modified but not yet staged
- Untracked files
- Staged files ready to commit

---

## ➕ Staging Files

```bash
git add <file>
```
Stages a specific file to be included in the next commit.

Example:
```bash
git add main.tf
```

```bash
git add .
```
Stages **all changes** (new files, modifications, deletions) in the project.

---

## ✅ Committing Changes

```bash
git commit -m "Your commit message"
```
Commits all staged files to the repository with a meaningful commit message.

Example:
```bash
git commit -m "Added EC2 Terraform configuration"
```

---

## ⬆️ Pushing Changes

```bash
git push
```
Uploads your local commits to the remote repository (e.g., GitHub).

---

## ⬇️ Pulling Changes

```bash
git pull
```
Fetches the latest changes from the remote repository and merges them with your local branch.

---

## 🚫 Using .gitignore

**`.gitignore`** is a special file you manually create in your project root directory to tell Git which files or directories to ignore (not track or commit).

Example:
```gitignore
# Terraform
*.tfstate
.terraform/

# System files
.DS_Store

# Logs
*.log
logs/
```

You can create and edit `.gitignore` like any other file:
```bash
touch .gitignore
nano .gitignore
```

---

## 📝 Summary of Commands

| Command                    | Description                                   |
|----------------------------|-----------------------------------------------|
| `git init`                | Initialize a new Git repository               |
| `git clone <repo-url>`    | Clone a remote repo to local                  |
| `git status`              | Check file change status                      |
| `git add <file>`          | Stage a specific file                         |
| `git add .`               | Stage all modified/added files                |
| `git commit -m "msg"`     | Commit staged files with a message            |
| `git push`                | Push local commits to GitHub                  |
| `git pull`                | Pull latest changes from GitHub               |
| `.gitignore`              | File to specify which files Git should ignore|

---

> 📘 Tip: Always use meaningful commit messages and pull the latest changes before pushing to avoid conflicts.
