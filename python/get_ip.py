from requests import get
import os
import requests

ip = get('https://api.ipify.org').content.decode('utf8').rstrip('\n')
apiToken = os.environ['TELEGRAM_TOKEN']

with open('/home/josecaliz/current_ip.txt', 'r') as file:
    current_ip = file.read().strip('\n')

def send_to_telegram(message):

    chatID = '1863029420'
    apiURL = f'https://api.telegram.org/bot{apiToken}/sendMessage'

    try:
        response = requests.post(apiURL, json={'chat_id': chatID, 'text': message})
        print(response.text)
    except Exception as e:
        print(e)


if ip != current_ip:
    send_to_telegram(f"Current IP: {ip}")

    with open('/home/josecaliz/current_ip.txt', 'w') as file:
        file.write(ip)

