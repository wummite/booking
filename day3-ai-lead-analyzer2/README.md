# Day 3 - AI Lead Analyzer

## What you will build

A Python application that sends customer enquiries to a Microsoft Foundry model
and receives structured JSON containing:

- intent
- urgency
- lead_score
- summary
- recommended_action

## Run order

1. Create and activate `.venv`
2. Install `requirements.txt`
3. Run `az login`
4. Copy `.env.example` to `.env`
5. Add your actual Foundry project endpoint and model/deployment name
6. Run `python 00_environment_check.py`
7. Run `python 01_test_connection.py`
8. Run `python 02_interactive_chat.py`
9. Run `python 03_lead_analyzer.py`
10. Optional: run `python 04_batch_analyzer.py`

## Windows PowerShell

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
pip install -r requirements.txt
az login
Copy-Item .env.example .env
python 00_environment_check.py
python 01_test_connection.py
python 02_interactive_chat.py
python 03_lead_analyzer.py
```

## macOS/Linux

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
pip install -r requirements.txt
az login
cp .env.example .env
python 00_environment_check.py
python 01_test_connection.py
python 02_interactive_chat.py
python 03_lead_analyzer.py
```

## Important

Do not commit the real `.env` file.
