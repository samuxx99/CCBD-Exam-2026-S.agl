# CCBD Exam 2026 — US Accidents 2022 Analysis

Exam project for Cloud Computing and Big Data (AA 2025-2026, Università di Catania).

The deliverable is an end-to-end analytical pipeline built on Google Cloud Platform. It features a self-documenting local Jupyter notebook that drives Google BigQuery to run six predefined analytical queries on the 2022 US Accidents dataset. The project also includes a predictive Logistic Regression model, a Spark implementation on Google Colab, and an interactive Looker Studio dashboard.

## Pipeline

`Kaggle CSV` → `Local Pandas Cleaning` → `Cloud Storage` → `BigQuery tables` → `Local Notebook analysis (6 queries)` → `ML (BigQuery ML Logistic Regression)` → `Spark Analysis (Colab)` → `Looker Studio dashboard`

## Repository Layout

```text
.
├── accident_analysis.ipynb          # Main self-documenting notebook (Primary Deliverable)
├── spark_analysis.ipynb             # Export of the Spark analysis performed on Google Colab
├── clean_data.py                    # Python script to extract and isolate the 2022 subset
├── README.md                        # This file — environment & architecture details
├── requirements.txt                 # Pinned Python dependencies
├── sql/                             # The six analytical queries (one .sql file each)
├── data/                            # Raw and cleaned CSVs (Git-ignored due to size)
└── .gitignore               
```

## Prerequisites & Local Setup

- **Python 3.11+** and a dedicated virtual environment.
- A **Google Cloud Project** with billing enabled (`ccbd-exam-2026-aglieco`).
- A **Service Account key** downloaded in JSON format to authenticate the BigQuery client.

To replicate the local Python environment, run:

```bash
pip install -r requirements.txt
```

## Project Details & External Links

- **GCP Project ID**: `ccbd-exam-2026-aglieco`
- **BigQuery Dataset**: `accidents_2022`
- **BigQuery Table**: `accidents_2022`
- **Looker Studio Dashboard**: https://datastudio.google.com/reporting/2813565b-ac79-4d56-ab4d-f57a88d9c867
- **Google Colab (Spark) Notebook**: https://drive.google.com/file/d/1dt9yXL1t5onjbV6BnMXXD5XMgchJhqZP/view?usp=sharing

### Download

**What.** Sobhan Moosavi *"US Accidents (2016 - 2023)"* — Kaggle dataset, licence **CC BY-NC-SA 4.0**. 1 CSV file:

| File                       | Role                                                              | Size    |
| -------------------------- | ----------------------------------------------------------------- | ------- |
| `US_Accidents_March23.csv` | countrywide traffic accidents - one row per accident (46 columns) | 3.06 GB |

**From where.** <https://www.kaggle.com/datasets/sobhanmoosavi/us-accidents>

## Project Stages (Exam Requirements)

### 1 & 2. Cloud Setup and Data Ingestion

The original US Accidents dataset is parsed and filtered locally via `clean_data.py` to isolate only 2022 events, drastically optimizing cloud footprint. The clean `.csv` is uploaded to a GCS Bucket and then loaded into BigQuery using `--autodetect`.

### 3. Data Manipulation in BigQuery

Six analytical queries are defined in external `.sql` files within the `sql/` directory. They are evaluated and executed programmatically from the local `accident_analysis.ipynb` notebook to investigate traffic distribution, bottleneck cities, and seasonal impacts.

### 4. Data Analysis with Spark

A parallel implementation of the analytical pipeline is built using the Managed Service for Apache Spark on Google Colab, comparing native Spark operators and Spark SQL.

### 5. Data Enrichment (BigQuery ML)

The local notebook orchestrates the training of a Logistic Regression classifier natively inside BigQuery (`ML.EVALUATE` and `ML.PREDICT`). It uses temporal and environmental features (like visibility and infrastructure elements) to predict the probability of a severe accident.

### 6. Data Visualization

A fully interactive dashboard connected to the live BigQuery tables is published via Looker Studio (linked above), enabling dynamic drill-downs and geographical mapping of the accident hotspots.