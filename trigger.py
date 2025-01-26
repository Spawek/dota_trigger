import requests
import keyboard

def send_empty_post():
    url = "http://example.com/endpoint"
    requests.post(url)
    print(f"Empty POST sent to {url}")

keyboard.add_hotkey('ctrl+shift+alt+d', send_empty_post)

print("Script is running. Press Ctrl+Shift+Alt+d to send an empty POST request.")
keyboard.wait()