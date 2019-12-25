#!/usr/bin/env bash

echo Cleanup...
rm -f adblock-rule.txt

echo Start Building...
echo "! Title: Personal Filter by kookxiang" >> adblock-rule.txt
echo "! TimeUpdated:" $(date --iso-8601=seconds) >> adblock-rule.txt
echo "! Expires: 7 days (update frequency)" >> adblock-rule.txt
echo "! Homepage: https://www.kookxiang.com" >> adblock-rule.txt

for file in rules/*; do
    echo Append rules from $file
    echo >> adblock-rule.txt
    cat $file >> adblock-rule.txt
done
