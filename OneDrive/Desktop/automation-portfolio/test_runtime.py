import requests
import json

# Login and get token
response = requests.post(
    'https://127.0.0.1:8443/api/login',
    json={"username": "admin", "password": "admin"},
    verify=False
)

print(response.status_code)
print(response.json())