#!/bin/bash
# Add a list of POIs to my account.
# Input format is LAT LON NAME, e.g. 56.5 -3 Nowhere interesting
# Uses category 5556288 which means Landscape:Cave.
# If you want a description then replace the # in texts:long.
# Obviously the API key and os_userid will need to be fixed.
# The output from a successful addition is JSON, see add_poi_output.json

touch log

cat caves.txt | while read lat lon name; do
  echo "Adding $name"
  echo "Adding $name" >> log
  curl 'https://www.outdooractive.com/api/v2/project/outdooractive/poi/?jsapi=1&lang=en&key=KK7FCKIF-EMWGMZBX-4OSSFOAR' \
  -H 'authority: www.outdooractive.com' \
  -H 'accept: application/json' \
  -H 'accept-language: en-GB,en-US;q=0.9,en;q=0.8' \
  -H 'content-type: application/json' \
  -H 'cookie: _consentCookie=%7B%22categories%22%3A%5B%22required%22%2C%22statistic%22%2C%22comfort%22%5D%7D; JSESSIONID=XEF9BC278AAB1E7BFECA545CBC58FEC7; browser_version_alert=shown; oa_session_id=pyPw92AAJ_fTd-YR06ScLbR9sXh1RLw1; oa_pl=Xq-8_SkTV6K98zzIpB3NXyFZMjaWV62bCf-qr0ayLFaG1I9GSkiSbhqbydtwCz5zREggRi5UhPNEzj9wzKCxPYrr67y2tJoZ.P0VUp7nTRxoGJCDX7RzRFNbniGo; oa_session_at=portal-1677597004613; oa_userid=702025840; l5763370552=1' \
  -H 'dnt: 1' \
  -H 'origin: https://www.outdooractive.com' \
  -H 'referer: https://www.outdooractive.com/en/mypage/pois.html' \
  -H 'sec-ch-ua: "Chromium";v="110", "Not A(Brand";v="24", "Google Chrome";v="110"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Windows"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36' \
  --data-raw '{"type":"poi","title":"'"$name"'","category":{"id":"5556288"},"images":[null],"texts":{"long":"#"},"point":["'"$lon"'","'"$lat"'"]}' \
  --compressed >> log 2>&1
done

