## BQ Analysis

This repository houses a comprehensive suite of tools and resources for BigQuery-based data analysis. It encompasses SQL scripts, Jupyter notebooks, DBT models, and auxiliary scripts, all structured to facilitate efficient data workflows and analytics.

---

### Repository Structure

```plaintext
bq-analysis/
├── .github/
│   └── workflows/            # GitHub Actions workflows for CI/CD
├── backup-repo.git/          # Backup repository for version control
├── data/                     # Raw and processed data files
├── dbt/                      # DBT models and configurations
├── notebooks/                # Jupyter notebooks for data exploration
├── scripts/                  # Utility scripts for data processing
├── sql/                      # SQL queries and views
├── .env.example              # Example environment variables
├── .gitattributes            # Git attributes for repository
├── .gitignore                # Git ignore rules
├── LICENSE                   # Project license
├── Makefile                  # Build automation tool
├── README.md                 # Project documentation
├── requirements.txt          # Python dependencies
└── setup.py                  # Python package setup
```

---

### Setup & Installation

#### Prerequisites

Ensure you have the following installed:

* Python 3.8+
* pip
* Google Cloud SDK (for BigQuery access)
* DBT (Data Build Tool)

#### Installation Steps

1. Clone the repository:

   ```bash
   git clone https://github.com/anormalguy96/bq-analysis.git
   cd bq-analysis
   ```

2. Set up a virtual environment:

   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows, use `venv\Scripts\activate`
   ```

3. Install required Python packages:

   ```bash
   pip install -r requirements.txt
   ```

4. Set up environment variables:

   Copy `.env.example` to `.env` and configure your credentials and project settings.

   ```bash
   cp .env.example .env
   ```

   Edit `.env` to include your Google Cloud project ID and other necessary configurations.

---

### Usage

#### Running SQL Queries

SQL queries are located in the `sql/` directory. To execute a query:

1. Navigate to the desired SQL file:

   ```bash
   cd sql/
   ```

2. Run the query using the BigQuery CLI:

   ```bash
   bq query --use_legacy_sql=false < query_file.sql
   ```

### Using DBT Models

DBT models are stored in the `dbt/` directory. To run DBT models:

1. Navigate to the DBT directory:

   ```bash
   cd dbt/
   ```

2. Set up DBT profiles by editing `profiles.yml` with your BigQuery credentials.

3. Run DBT commands:

   ```bash
   dbt run
   dbt test
   ```

#### Executing Notebooks

Jupyter notebooks for data analysis are in the `notebooks/` directory. To run a notebook:

1. Launch Jupyter Notebook:

   ```bash
   jupyter notebook
   ```

2. Open the desired notebook from the browser interface.

---

### Automation with Makefile

The `Makefile` provides automation for common tasks. Available commands:

* `make setup` which sets up the environment.
* `make run` that executes the main data processing pipeline.
* `make clean` - this cleans up temporary files.

Run `make` to see all available commands.

---

### Security & Secrets Management

Sensitive information, such as Google Cloud credentials, should not be committed to the repository. Ensure that:

* Credentials are stored in environment variables or secured vaults.
* `.gitignore` includes entries for sensitive files (like `*.json` or `.env`, let's say)

---

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

### Acknowledgments

* [Google BigQuery Documentation](https://cloud.google.com/bigquery/docs)
* [DBT Documentation](https://docs.getdbt.com/)
* [Jupyter Documentation](https://jupyter.org/)

---

**Thank You Very Much!** 
