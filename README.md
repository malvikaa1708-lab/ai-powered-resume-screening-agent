
# 🤖 AI-Powered Resume Screening Agent

![n8n](https://img.shields.io/badge/n8n-Workflow%20Automation-orange)
![OpenAI](https://img.shields.io/badge/OpenAI-GPT--4o-green)
![Google Sheets](https://img.shields.io/badge/Google-Sheets-blue)
![Gmail](https://img.shields.io/badge/Gmail-Automation-red)
![Webhook](https://img.shields.io/badge/Webhook-API-purple)
![License](https://img.shields.io/badge/License-MIT-yellow)

An AI-powered recruitment automation system built with **n8n** that automatically screens resumes, evaluates candidates against a job description using an LLM, stores results in Google Sheets, and sends personalized email notifications.

---

# 🚀 Features

- Resume submission through Tally Forms
- Webhook-based automation
- Automatic PDF download
- Resume text extraction
- AI-powered candidate evaluation
- Match score generation
- Selection/Rejection decision
- Google Sheets integration
- Automated email notifications
- Zero manual screening

---

# 🏗 Workflow Architecture

```
Candidate Form
      │
      ▼
Webhook Trigger
      │
      ▼
HTTP Request
      │
      ▼
Download Resume PDF
      │
      ▼
Extract PDF Text
      │
      ▼
OpenAI Resume Analysis
      │
      ▼
Structured JSON Output
      │
      ▼
Google Sheets
      │
      ▼
IF Decision
      │
 ┌────┴─────┐
 ▼          ▼
Selected   Rejected
 │           │
 ▼           ▼
Email      Email
```

---

# 📸 Workflow

![Workflow](images/workflow.png)

---

# 🛠 Tech Stack

- n8n
- OpenAI GPT-4o Mini
- Tally Forms
- Webhooks
- HTTP Request
- PDF Parser
- Google Sheets API
- Gmail
- JSON Parser

---

# 📂 Project Structure

```text
workflow/
images/
docs/
sample-data/
prompts/
README.md
```

---

# ⚙️ Setup

1. Clone the repository

```
git clone https://github.com/yourusername/ai-powered-resume-screening-agent.git
```

2. Import the JSON workflow into n8n

3. Configure credentials

- OpenAI
- Gmail
- Google Sheets

4. Replace the Job Description

5. Activate the workflow

---

# 📊 Output

The workflow automatically stores

- Candidate Name
- Email
- Resume
- Match Score
- Decision
- AI Reasoning

inside Google Sheets.

---

# 🔮 Future Improvements

- ATS Resume Parsing
- OCR Support
- Multi-job role support
- Vector Database
- RAG-based Resume Search
- Dashboard Analytics

---

# 👩‍💻 Author

**Malvika**

AI Automation | n8n | OpenAI | Workflow Automation | LLM Applications
