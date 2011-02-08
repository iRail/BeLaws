#!/usr/bin/bash
#
# This script will fetch all the html pages and stores them in a directory. As an input it wants the data returned by the scraper.pl script in this same directory.
#
#
# Disclaimer: You should not use this script. It is here for educational purpose only. It will generate a serious amount of traffic to fgov.be. You can download the entire datadump from our github page: github.com/iRail/BeLaws
#
# Author: Pieter Colpaert
# (c) 2011 iRail vzw/asbl
# license: AGPL
#
# usage: bash fetcher.sh < results
#

while read a ; do {
  wget "http://www.ejustice.just.fgov.be/cgi_loi/loi_a1.pl?caller=list&cn=$a&la=N&sql=dt+not+contains+'foo'&language=nl&chercher=t&fromtab=wet_all" -O laws/$a.html ;
} done

#
# cn is a lawID built like this: Y+M+D+n°ofLawThatDay
