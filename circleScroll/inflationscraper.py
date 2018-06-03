# import libraries
from bs4 import BeautifulSoup
import requests

# specify the url
quote_page = requests.get('http://www.usinflationcalculator.com/inflation/current-inflation-rates/')

# parse the html using beautiful soup and store in variable `soup`
soup = BeautifulSoup(quote_page.text, 'html.parser')

# Take out the <div> of name and get its value
data = soup.find('aside', {'id': 'text-176031101'})
data = data.find('u')
data = data.text
print(data)