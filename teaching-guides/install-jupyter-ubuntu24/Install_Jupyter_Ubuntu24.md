# Install Jupyter Notebook on Ubuntu 24.04

## Prerequisites
- Ubuntu 24.04 server or desktop
- Non-root user with sudo privileges
- Python 3.7 or higher installed
- Basic terminal knowledge

---

## Method 1: Using pip (recommended)

### 1. Update package list
```bash
sudo apt update && sudo apt upgrade -y
```
### 2. Install Python and required libraries
```bash
sudo apt install python3 python3-pip python3-dev python3-venv -y
```
### 3. Create a virtual environment
```bash
python3 -m venv jupyter_env
source jupyter_env/bin/activate
```
### 4. Install Jupyter Notebook
```bash
pip install jupyter
```
### 5. Verify installation
```bash
jupyter --version
```

## Method 2: Using APT

### Install Jupyter Notebook
```bash
sudo apt install jupyter-notebook -y
```
### Verify installation
```bash
jupyter-notebook --version
```

## Running Jupyter Notebook

After installation, run Jupyter Notebook with your Python version.
For example, if you are using Python 3.12:
```bash
python3.12 -m notebook
```
Tip: Check your Python version with:
```bash
python3 --version
```

### Notes
- Method 1 (pip + virtual environment) is cleaner and avoids conflicts.
- Method 2 (APT) is simpler but may install older versions.
- Always verify your Python version before running Jupyter.
یادداشت: این راهنما برای آموزش و بازتولید طراحی شده است. روش اول (pip) توصیه می‌شود زیرا محیط مجازی تمیزتر و قابل کنترل‌تر است.