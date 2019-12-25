#!/usr/bin/env bash

dateValue="$(TZ=GMT env LANG=en_US.UTF-8 date +'%a, %d %b %Y %H:%M:%S GMT')"
signStr="PUT\n\ntext/plain\n${dateValue}\n/kookxiang-public/adblock-rule/kookxiang.txt"
signature=$(echo -en ${signStr} | openssl sha1 -hmac ${OSS_ACCESS_KEY_SECRET} -binary | base64)

curl -sSL -q -X PUT -T adblock-rule.txt \
    -H "Host: kookxiang-public.oss-cn-shenzhen.aliyuncs.com" \
    -H "Date: ${dateValue}" \
    -H "Content-Type: text/plain" \
    -H "Authorization: OSS ${OSS_ACCESS_KEY_ID}:${signature}" \
    https://kookxiang-public.oss-cn-shenzhen.aliyuncs.com/adblock-rule/kookxiang.txt
