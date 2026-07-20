{
  "name": "AI powered resume selection",
  "nodes": [
    {
      "parameters": {
        "httpMethod": "POST",
        "path": "e1df7a0e-442d-4744-9f60-911abac14a6e",
        "options": {}
      },
      "type": "n8n-nodes-base.webhook",
      "typeVersion": 2.1,
      "position": [
        0,
        0
      ],
      "id": "46486730-b2b0-48c9-b0f3-16c2ab631e9a",
      "name": "Webhook",
      "webhookId": "e1df7a0e-442d-4744-9f60-911abac14a6e"
    },
    {
      "parameters": {
        "url": "={{ $json.body.data.fields[3].value[0].url }}",
        "options": {
          "response": {
            "response": {
              "responseFormat": "file"
            }
          }
        }
      },
      "type": "n8n-nodes-base.httpRequest",
      "typeVersion": 4.4,
      "position": [
        208,
        0
      ],
      "id": "446c5889-4504-4f51-b489-31efe72f640d",
      "name": "HTTP Request"
    },
    {
      "parameters": {
        "operation": "pdf",
        "options": {}
      },
      "type": "n8n-nodes-base.extractFromFile",
      "typeVersion": 1.1,
      "position": [
        416,
        0
      ],
      "id": "cb998187-10c6-46b9-9af8-1a51dda84006",
      "name": "Extract from File"
    },
    {
      "parameters": {
        "promptType": "define",
        "text": "=You are an expert HR screening assistant.\n\nCompare the candidate's resume with the job description below.\n\nReturn strictly in JSON format:\n\n{\n  \"match_score\": number (0-100),\n  \"decision\": \"Selected\" or \"Rejected\",\n  \"reason\": \"Short explanation in 2-3 lines\"\n}\n\nJob Description:\nWe are hiring a Data Analyst with skills in Python, SQL, Data Visualization, Machine Learning basics, and strong analytical thinking.\n\nCandidate Resume:\n{{$json.text}}",
        "hasOutputParser": true,
        "options": {}
      },
      "type": "@n8n/n8n-nodes-langchain.agent",
      "typeVersion": 3.1,
      "position": [
        624,
        0
      ],
      "id": "YOUR_OPENAI_API_KEY",
      "name": "AI Agent"
    },
    {
      "parameters": {
        "model": {
          "__rl": true,
          "mode": "list",
          "value": "gpt-5-mini"
        },
        "builtInTools": {},
        "options": {}
      },
      "type": "@n8n/n8n-nodes-langchain.lmChatOpenAi",
      "typeVersion": 1.3,
      "position": [
        480,
        208
      ],
      "id": "YOUR_OPENAI_ID",
      "name": "OpenAI Chat Model",
      "credentials": {
        "openAiApi": {
          "id": "YOUR_OPENAI_API_KEY",
          "name": "n8n free OpenAI API credits"
        }
      }
    },
    {
      "parameters": {
        "jsonSchemaExample": "{\n  \"match_score\": 85,\n  \"decision\": \"Selected\",\n  \"reason\": \"Candidate has strong Python and SQL skills.\"\n}"
      },
      "type": "@n8n/n8n-nodes-langchain.outputParserStructured",
      "typeVersion": 1.3,
      "position": [
        800,
        208
      ],
      "id": "af77026d-f170-47a4-9a09-fe0b91b97342",
      "name": "Structured Output Parser"
    },
    {
      "parameters": {
        "operation": "append",
        "documentId": {
          "__rl": true,
          "value": "1dwDUGrXGzJztyJF2yL44WKfoa0Roje3GeE-et4lz8oA",
          "mode": "list",
          "cachedResultName": "resume",
          "cachedResultUrl": "https://docs.google.com/spreadsheets/d/1dwDUGrXGzJztyJF2yL44WKfoa0Roje3GeE-et4lz8oA/edit?usp=drivesdk"
        },
        "sheetName": {
          "__rl": true,
          "value": "gid=0",
          "mode": "list",
          "cachedResultName": "Sheet1",
          "cachedResultUrl": "https://docs.google.com/spreadsheets/d/1dwDUGrXGzJztyJF2yL44WKfoa0Roje3GeE-et4lz8oA/edit#gid=0"
        },
        "columns": {
          "mappingMode": "defineBelow",
          "value": {
            "Name": "={{ $('Webhook').item.json.body.data.fields[0].value }}",
            "Email": "={{ $('Webhook').item.json.body.data.fields[1].value }}",
            "Match Score": "={{ $json.output.match_score }}",
            "Decision ": "={{ $json.output.decision }}",
            "Reason": "={{ $json.output.reason }}"
          },
          "matchingColumns": [],
          "schema": [
            {
              "id": "Name",
              "displayName": "Name",
              "required": false,
              "defaultMatch": false,
              "display": true,
              "type": "string",
              "canBeUsedToMatch": true
            },
            {
              "id": "Email",
              "displayName": "Email",
              "required": false,
              "defaultMatch": false,
              "display": true,
              "type": "string",
              "canBeUsedToMatch": true
            },
            {
              "id": "Match Score",
              "displayName": "Match Score",
              "required": false,
              "defaultMatch": false,
              "display": true,
              "type": "string",
              "canBeUsedToMatch": true
            },
            {
              "id": "Decision ",
              "displayName": "Decision ",
              "required": false,
              "defaultMatch": false,
              "display": true,
              "type": "string",
              "canBeUsedToMatch": true
            },
            {
              "id": "Reason",
              "displayName": "Reason",
              "required": false,
              "defaultMatch": false,
              "display": true,
              "type": "string",
              "canBeUsedToMatch": true
            }
          ],
          "attemptToConvertTypes": false,
          "convertFieldsToString": false
        },
        "options": {}
      },
      "type": "n8n-nodes-base.googleSheets",
      "typeVersion": 4.7,
      "position": [
        976,
        0
      ],
      "id": "YOUR_GMAIL_ACCOUNT",
      "name": "Append row in sheet",
      "credentials": {
        "googleSheetsOAuth2Api": {
          "id": "itndO0v4SdbYxx4J",
          "name": "YOUR_GOOGLE_CREDENTIALS"
        }
      }
    },
    {
      "parameters": {
        "conditions": {
          "options": {
            "caseSensitive": true,
            "leftValue": "",
            "typeValidation": "loose",
            "version": 3
          },
          "conditions": [
            {
              "id": "d111fe59-60fe-4673-be21-aa8cdaaa108b",
              "leftValue": "={{ $json['Match Score'] }}",
              "rightValue": 70,
              "operator": {
                "type": "number",
                "operation": "gt"
              }
            },
            {
              "id": "b4503cd3-8784-487b-9489-90cf9c0f37ae",
              "leftValue": "",
              "rightValue": "",
              "operator": {
                "type": "string",
                "operation": "equals",
                "name": "filter.operator.equals"
              }
            }
          ],
          "combinator": "and"
        },
        "looseTypeValidation": true,
        "options": {}
      },
      "type": "n8n-nodes-base.if",
      "typeVersion": 2.3,
      "position": [
        1184,
        0
      ],
      "id": "5bb19ce2-26bb-459b-821a-6ebc3dfa62fa",
      "name": "If"
    },
    {
      "parameters": {
        "sendTo": "={{ $('Webhook').item.json.body.data.fields[1].value }}",
        "subject": "Congratulations! You are shortlisted 🎉",
        "message": "=Dear {{ $('Webhook').item.json.body.data.fields[1].value }},  We are pleased to inform you that you have been shortlisted for the next round. Our team will contact you soon.  \nBest regards, HR Team",
        "options": {}
      },
      "type": "n8n-nodes-base.gmail",
      "typeVersion": 2.2,
      "position": [
        1392,
        -96
      ],
      "id": "f06065b4-439f-4d8a-985a-4f5bf6a6e8a2",
      "name": "Send a message",
      "webhookId": "993fe635-f692-44e8-b44c-1c465fbf490b",
      "credentials": {
        "gmailOAuth2": {
          "id": "LrX3KI4ipbnRbZ8e",
          "name": "YOUR_GOOGLE_CREDENTIALS"
        }
      }
    },
    {
      "parameters": {
        "sendTo": "={{ $('Webhook').item.json.body.data.fields[1].value }}",
        "subject": "Application Update",
        "message": "=Dear ,{{ $('Webhook').item.json.body.data.fields[1].value }}.  Thank you for applying. After reviewing your profile, we regret to inform you that you were not shortlisted this time.We \nencourage you to apply again in the future.  \nBest regards, HR Team",
        "options": {}
      },
      "type": "n8n-nodes-base.gmail",
      "typeVersion": 2.2,
      "position": [
        1392,
        96
      ],
      "id": "e3f2b955-6ec6-4c4e-bce4-7533b0891713",
      "name": "Send a message1",
      "webhookId": "b76f094e-2588-4d36-bd45-0ef8fbd2a5d3",
      "credentials": {
        "gmailOAuth2": {
          "id": "LrX3KI4ipbnRbZ8e",
          "name": "YOUR_GOOGLE_CREDENTIALS"
        }
      }
    }
  ],
  "pinData": {},
  "connections": {
    "Webhook": {
      "main": [
        [
          {
            "node": "HTTP Request",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "HTTP Request": {
      "main": [
        [
          {
            "node": "Extract from File",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "Extract from File": {
      "main": [
        [
          {
            "node": "AI Agent",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "OpenAI Chat Model": {
      "ai_languageModel": [
        [
          {
            "node": "AI Agent",
            "type": "ai_languageModel",
            "index": 0
          }
        ]
      ]
    },
    "Structured Output Parser": {
      "ai_outputParser": [
        [
          {
            "node": "AI Agent",
            "type": "ai_outputParser",
            "index": 0
          }
        ]
      ]
    },
    "AI Agent": {
      "main": [
        [
          {
            "node": "Append row in sheet",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "Append row in sheet": {
      "main": [
        [
          {
            "node": "If",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "If": {
      "main": [
        [
          {
            "node": "Send a message",
            "type": "main",
            "index": 0
          }
        ],
        [
          {
            "node": "Send a message1",
            "type": "main",
            "index": 0
          }
        ]
      ]
    }
  },
  "active": false,
  "settings": {
    "executionOrder": "v1",
    "binaryMode": "separate",
    "availableInMCP": false
  },
  "versionId": "fd133440-863f-41aa-b421-5ac3ec49cbbf",
  "meta": {
    "templateCredsSetupCompleted": true,
    "instanceId": "4bf5f1bc62dac37bfc584b2a391b87e5ac02a18194e90c440b0b7a3770383d6d"
  },
  "id": "xZjx7HaQmPBhhgz6",
  "tags": []
}
