# python 3

import feedparser
from requests import get
from bs4 import BeautifulSoup

news_feed = feedparser.parse("https://docs.cloud.oracle.com/iaas/images/feed/")
entry = news_feed.entries[0]
# print ('Number of RSS posts :', len(news_feed.entries))

for entry in news_feed.entries:
    if "Oracle-Linux-" in entry.title:
        print ('-----------------------------------------------------------------')
        print ('    // Visit: https://docs.cloud.oracle.com/iaas/images/')
        print ('    // Oracle - provided image: ' + entry.title)
        print ('    default = {')
        alink = entry.links[0].href
        response = get(alink)
        soup = BeautifulSoup(response.text, 'html.parser')
        found_div = soup.find('div', class_="uk-overflow-auto")
        ocids = found_div.find_all('td')
        for i in range(len(ocids)):
            if i % 2:
                print ("    " + ocids[i-1].text + ' = ' + '"' + ocids[i].text + '"')
        print ('    }')