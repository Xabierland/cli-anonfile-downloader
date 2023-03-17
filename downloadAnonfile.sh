#!/bin/bash
read -p "URL: " url

durl=$(curl -s $url | awk -v RS='<' '/id="download-url"/{print gensub(/^.*href="([^"]*)".*$/, "\\1","g", $0)}')

wget --referer=https://anonfiles.com/ $durl
