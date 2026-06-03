# 🏦 Loan Default Prediction & Risk Analysis

An end-to-end data science project to predict loan defaults 
using real banking data of 150,000+ customers.

## 🛠️ Tech Stack
- **Python** (Pandas, Seaborn, Scikit-learn)
- **MySQL** (Data storage & business queries)
- **Machine Learning** (Logistic Regression, Random Forest)
- **Power BI** (Interactive dashboard)

## 📁 Project Structure
loan_project/
├── data/               ← Cleaned dataset
├── notebooks/          ← Jupyter notebooks
│   ├── 01_EDA.ipynb
│   └── 02_ML_Model.ipynb
├── sql/                ← SQL queries
├── output/             ← ML predictions
└── powerbi/            ← Power BI dashboard

## 📊 Project Phases
1. **SQL** - Loaded 150K rows into MySQL, wrote 5 business queries
2. **EDA** - Explored data, handled missing values, visualized patterns
3. **ML Model** - Trained Random Forest achieving AUC-ROC of 0.86
4. **Power BI** - Built 2-page interactive dashboard

## 🔍 Key Findings
- Overall default rate is ~6.7%
- Younger customers have higher default rates
- Low income + high debt ratio = highest risk
- Total late payments is the most important feature

## 🚀 How to Run
1. Clone the repo
2. Install requirements: `pip install -r requirements.txt`
3. Run `01_EDA.ipynb` first
4. Then run `02_ML_Model.ipynb`