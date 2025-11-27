
# Install Jupyter Notebook on Ubuntu 24.04

This guide explains how to install and run Jupyter Notebook on Ubuntu 24.04 using either a **virtual environment** (recommended) or system-wide installation.  
The virtual environment approach keeps dependencies isolated and avoids conflicts.

## Option 1: Using a Virtual Environment (recommended)

### 1. Install the `python3-venv` package
```bash
sudo apt update
sudo apt install python3-venv -y
```

### 2. Create a project directory and virtual environment
```bash
mkdir ~/my_project
cd ~/my_project
python3 -m venv venv
```

### 3. Activate the virtual environment
```bash
source venv/bin/activate
```
You should now see `(venv)` at the beginning of your terminal prompt, indicating the environment is active.

### 5. Start Jupyter Notebook
```bash
jupyter notebook
```

---

## Option 2: System-wide Installation

If you prefer installing packages globally:
```bash
sudo apt update
sudo apt install python3-pip -y
pip3 install notebook scikit-learn
```

Then start Jupyter Notebook:
```bash
jupyter notebook
```

---

## Reusing the Virtual Environment

Each time you want to use Jupyter Notebook with your virtual environment:

```bash
cd ~/my_project
source venv/bin/activate
jupyter notebook
```

This ensures your ML code runs correctly and smoothly with isolated dependencies.

---

## Notes
- **Virtual environment method** is recommended for reproducibility and avoiding conflicts.  
- **System-wide installation** is simpler but may affect other Python projects.  

---

## یادداشت
- این راهنما برای نصب و اجرای Jupyter Notebook در اوبونتو 24.04 طراحی شده است.  
- استفاده از محیط مجازی توصیه می‌شود زیرا وابستگی‌ها را جدا نگه می‌دارد و از تداخل جلوگیری می‌کند.  
- روش نصب سراسری ساده‌تر است اما ممکن است روی پروژه‌های دیگر پایتون تأثیر بگذارد.  
```
