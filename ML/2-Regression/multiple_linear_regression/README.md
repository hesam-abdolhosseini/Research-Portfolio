
# Multiple Linear Regression

This module introduces **Multiple Linear Regression**, an extension of simple linear regression where **two or more independent variables** are used to predict a continuous target variable.  
It is aligned with the IBM ML0101EN course and designed for reproducibility and classroom use.

## Overview

Multiple Linear Regression models the relationship between a dependent variable \( y \) and several independent variables \( x_1, x_2, ..., x_n \).  
It is useful when:

- A single feature is not enough to explain the target  
- You want to measure the **strength and direction** of each predictor  
- You want to understand **how changes in inputs affect the output**  
- You need a model that predicts a **continuous** value (e.g., CO₂ emissions)

Example use case from the course:  
Predicting CO₂ emissions using **engine size**, **number of cylinders**, and **fuel consumption**.

---

## Contents

This folder includes:

- `LAB_Multiple_Linear_Regression.ipynb`
- `LAB_Multiple_Linear_Regression.pdf` 
- `FuelConsumptionCo2.csv` → dataset used for the lab  
- `README.md` (this file)

---

## Key Concepts

### What Multiple Linear Regression Can Do
- Identify which variables significantly affect the target  
- Estimate how much the target changes when each feature changes  
- Predict outcomes for new, unseen data  
- Provide interpretable coefficients (weights)

### Model Form

The model predicts:

\[
\hat{y} = \theta_0 + \theta_1 x_1 + \theta_2 x_2 + \dots + \theta_n x_n
\]

Or in vector form:

\[
\hat{y} = \theta^T x
\]

Where:

- \( \theta \) = parameter (weight) vector  
- \( x \) = feature vector  
- \( \theta_0 \) = intercept  
- \( \theta_1, \theta_2, ... \) = effect of each feature  

### Geometry

- In simple regression → best‑fit **line**  
- In multiple regression → best‑fit **plane** or **hyperplane**

---

## How Parameters Are Found

Two common approaches:

### **1. Ordinary Least Squares (OLS)**
- Minimizes the **Mean Squared Error (MSE)**  
- Uses matrix operations  
- Works well for datasets with fewer than ~10,000 rows  

### **2. Optimization Algorithms**
- Used for large datasets  
- Example: **Gradient Descent**  
- Iteratively updates parameters to reduce error  

---

## Model Evaluation

Common metrics:

- **MAE** – Mean Absolute Error  
- **MSE** – Mean Squared Error  
- **RMSE** – Root Mean Squared Error  
- **R² Score** – How well the model fits the data (1.0 is perfect)

---

## ⚠️ Important Notes

- Adding too many features may cause **overfitting**  
- Categorical variables must be converted to numeric (e.g., one‑hot encoding)  
- Each predictor should have a **linear relationship** with the target  
- Scatter plots help check linearity  
- Non‑linear relationships require **non‑linear regression**

---

## یادداشت (فارسی)

این ماژول به **رگرسیون خطی چندگانه** می‌پردازد؛ مدلی که از چندین متغیر مستقل برای پیش‌بینی یک مقدار پیوسته استفاده می‌کند.  
این روش زمانی کاربرد دارد که:

- یک ویژگی برای پیش‌بینی کافی نباشد  
- بخواهیم تأثیر هر ویژگی را روی خروجی اندازه‌گیری کنیم  
- بخواهیم بدانیم تغییر هر ویژگی چه اثری روی مقدار خروجی دارد  
- نیاز به مدلی قابل تفسیر و قابل بازتولید داشته باشیم  

مدل به صورت زیر تعریف می‌شود:

\[
\hat{y} = \theta_0 + \theta_1 x_1 + \theta_2 x_2 + \dots + \theta_n x_n
\]

و هدف، **کمینه کردن خطا** (MSE) و یافتن بهترین ضرایب است.

