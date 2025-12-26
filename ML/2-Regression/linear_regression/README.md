# **Simple Linear Regression Lab**

This folder contains a reproducible lab on **Simple Linear Regression** aligned with the IBM ML0101EN course.  
It introduces the core ideas of linear regression, demonstrates how to fit a model using real data, and guides you through prediction and evaluation.

---

## **Overview**

Simple Linear Regression models the relationship between:

- **One independent variable** (e.g., engine size)  
- **One continuous dependent variable** (e.g., CO₂ emissions)

The goal is to fit a **straight line** that best represents the relationship between the two variables.

### **Model Form**

\[
\hat{y} = \theta_0 + \theta_1 x_1
\]

Where:

- \( \hat{y} \) → predicted value  
- \( x_1 \) → independent variable  
- \( \theta_0 \) → intercept  
- \( \theta_1 \) → slope (effect of the feature)  

The model finds the best values for \( \theta_0 \) and \( \theta_1 \) by minimizing the **Mean Squared Error (MSE)** between actual and predicted values.

This lab walks you through:

- Understanding the dataset  
- Visualizing relationships  
- Fitting a regression line  
- Making predictions  
- Evaluating model accuracy  

---

## **Contents**

- `FuelConsumptionCo2.csv` → dataset of vehicle fuel consumption and CO₂ emissions  
- `LAB_Simple_Linear_Regression.ipynb` → notebook with lab instructions  
- `LAB_Simple_Linear_Regression.pdf` → static version of the lab  
- `LAB_Simple_Linear_Regression_with_output.ipynb` → notebook with executed outputs  
- `LAB_Simple_Linear_Regression_with_output.pdf` → static version with outputs  

---

## **How to Run**

1. **Ensure Jupyter Notebook is installed**  
   - Linux/macOS: run `jupyter notebook` in the terminal  
   - Windows: run `jupyter notebook` in Anaconda Prompt or Command Prompt  

2. **Place the `.ipynb` file** (e.g., `LAB_Simple_Linear_Regression.ipynb`) inside your Jupyter working directory.

3. **Launch Jupyter Notebook**
   ```bash
   jupyter notebook
   ```
   This opens the Jupyter interface in your browser.

4. **Open the notebook and run cells step‑by‑step**
   - The notebook automatically installs required dependencies (`numpy`, `pandas`, `matplotlib`, `scikit‑learn`)  
   - Outputs appear as you execute each section  

---

## **یادداشت (فارسی)**

این پوشه شامل آزمایش **رگرسیون خطی ساده** است.  
در این آزمایش یاد می‌گیرید که چگونه:

- رابطه بین یک ویژگی (مثل اندازه موتور) و یک مقدار پیوسته (مثل انتشار CO₂) را مدل کنید  
- خط رگرسیون را براساس داده‌ها برازش کنید  
- مقادیر جدید را پیش‌بینی کنید  
- دقت مدل را با معیارهایی مثل MSE و MAE ارزیابی کنید  

### **محتویات**
- دیتاست `FuelConsumptionCo2.csv`  
- نوت‌بوک اصلی و نسخه‌های دارای خروجی  
- نسخه‌های PDF برای مطالعه آفلاین  

### **نحوه اجرا**
- کافی است فایل نوت‌بوک را در پوشه Jupyter قرار دهید  
- Jupyter را اجرا کنید  
- سلول‌ها را به ترتیب اجرا کنید  
- کتابخانه‌های لازم به‌صورت خودکار نصب می‌شوند  
