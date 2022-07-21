import requests
from bs4 import BeautifulSoup

URL = "https://github.com/Sandalots/Sinister-Octopus"
page = requests.get(URL)

soup = BeautifulSoup(page.content, "html.parser")
results = soup.find(id="readme")
print(results.prettify())