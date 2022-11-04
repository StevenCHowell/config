#!/usr/bin/env python

import os
import re
import sys
import requests

filename_matcher = re.compile(r'http://www.oreilly.com/(.*)/free/(.*).csp')

def main():
    categories = sys.argv[1:]
    urls = map(lambda x: 'http://www.oreilly.com/{}/free/'.format(x), categories)
    print(list(urls))
    filenames_map = map(retrieve_filenames, urls)
    filenames_list = list(filenames_map)
    categories_and_urls = zip(categories, urls)
    print(list(categories_and_urls))
    print(list(categories))
    print(list(urls))
    for (category, url), filenames in zip(categories_and_urls, filenames_map):
        print(category, url, filenames)
        if not os.path.exists(category):
            os.makedirs(category)
        for title, (book_category, files) in filenames.items():
            path = os.path.join(category, title)
            if not os.path.exists(path):
                os.makedirs(path)
            print('\t{}\t{}'.format(title, files))
            for file in files:
                print('\t\t{}'.format(file))
                download_file(os.path.join(category, title, file),
                              'http://www.oreilly.com/{}/free/files/{}'.format(book_category, file))


def download_file(path, url):
    response = requests.get(url, stream=True)
    with open(path, 'wb') as f:
        for chunk in response.iter_content(chunk_size=1024):
            if chunk:
                f.write(chunk)


def retrieve_filenames(url):
    response = requests.get(url).text
    matches = filename_matcher.findall(response)
    return {
        name: (category, map(lambda x: x.format(name), ['{}.pdf', '{}.mobi', '{}.epub']))
        for (category, name) in matches
    }


if __name__ == '__main__':
    main()
