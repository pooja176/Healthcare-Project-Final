import mysql.connector
import pandas as pd 
# 1. MySQL Connection
conn = mysql.connector.Connect(
    host = "localhost",
    user = "root",
    password = "YOUR_PASSWORD",
    database = "healthcare_analysis"
)

# 2. Load Data from SQL
df = pd.read_sql("SELECT * FROM healthcare_data",conn)
print (f"Total Records Loaded: {len(df)}")
print (df.columns.tolist())

# 3. Analysis - Treatment Cost Pattern
print("Smoker average cost:")
print(df.groupby ('Smoker')['Treatment_Cost'].mean())
print("\nDiabetes average cost:")
print(df.groupby('Diabetes')['Treatment_Cost'].mean())

# 4. Extra KPIs - Power BI Cards jaisa
print(f"\nTotal Treatment Cost: {df['Treatment_Cost'].sum()}")
print(f"Avg BMI: {df['BMI'].mean():.2f}")
print(f"Total Hospital Visits: {df['Hospital_Visits'].sum()}")

# 5. Cholesterol Analysis - jo SQL me kiya
print("\nCholesterol average cost:")
print(df.groupby('Cholesterol_Level')['Treatment_Cost'].mean())

# 6. Visualizations for GitHub
import matplotlib.pyplot as plt
import seaborn as sns

plt.figure()
sns.barplot(x='Smoker', y='Treatment_Cost', data=df)
plt.title('Treatment Cost by Smoker')
plt.savefig('Smoker_cost.png')
print("\nChart saved: smoker_cost.png")

plt.figure()
sns.countplot(x='Gender', data=df)
plt.title('Count by Gender')
plt.savefig('gender_count.png')
print("Chart saved: gender_count.png")
print("\n--- Analysis Complete! ---")

conn.close()