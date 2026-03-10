## EDA ANALYSIS

```python
# ----------------------------------------------------
# 1. Overall Sales Performance
# ----------------------------------------------------

total_sales = df['sales'].sum()
total_profit = df['profit'].sum()
total_quantity = df['quantity_sold'].sum()

print("Total Sales:", total_sales)
print("Total Profit:", total_profit)
print("Total Quantity Sold:", total_quantity)
```
```python
# ----------------------------------------------------
# 2. Sales Trend Over Time
# ----------------------------------------------------

# Extract year and month
df['year'] = df['order_date'].dt.year
df['month'] = df['order_date'].dt.month

# Monthly sales trend
monthly_sales = df.groupby('month')['sales'].sum()

```python
# ----------------------------------------------------
# 4. Sub-Category Analysis (Top 5)
# ----------------------------------------------------

top_subcategories = df.groupby('sub_category')['sales'].sum().sort_values(ascending=False).head(5)

print(top_subcategories)

# Visualization
top_subcategories.plot(kind='bar', title='Top 5 Sub-Categories by Sales')
```

```python
# ----------------------------------------------------
# 6. Profitability Analysis
# ----------------------------------------------------

profit_analysis = df.groupby('product_category')[['sales','profit']].sum()

profit_analysis['profit_margin'] = profit_analysis['profit'] / profit_analysis['sales']

print(profit_analysis.sort_values(by='profit_margin'))
```

```python
# ----------------------------------------------------
# 7. Customer Purchasing Behavior
# ----------------------------------------------------

import seaborn as sns
import matplotlib.pyplot as plt

sns.histplot(df['quantity_sold'], bins=10)
plt.title("Distribution of Order Quantities")
plt.xlabel("Quantity Sold")
plt.ylabel("Frequency")
plt.show()

# Summary statistics
df['quantity_sold'].describe()
```

```python
# ----------------------------------------------------
# 8. Relationship Analysis
# ----------------------------------------------------

# Correlation matrix
corr = df[['sales','quantity_sold','profit']].corr()

print(corr)

# Heatmap visualization
sns.heatmap(corr, annot=True)
plt.title("Correlation Between Sales, Quantity, and Profit")
plt.show()

# Scatter plot: Quantity vs Sales
sns.scatterplot(x='quantity_sold', y='sales', data=df)
plt.title("Quantity vs Sales")
plt.show()

# Scatter plot: Sales vs Profit
sns.scatterplot(x='sales', y='profit', data=df)
plt.title("Sales vs Profit")
plt.show()
```

monthly_sales.plot(kind='line', marker='o', title='Monthly Sales Trend')
```
