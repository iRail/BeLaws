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
#

while read a do
URL="http://www.ejustice.just.fgov.be/cgi_loi/change_lg.pl?language=nl&la=N&table_name=wet&cn=2010042801");

#
# Example URL:
#http://www.ejustice.just.fgov.be/cgi_loi/change_lg.pl
#?language=nl
#&la=N
#&table_name=wet
#&cn=2010042801 → ONLY IMPORTANT VALUE
#
# cn is a lawID built like this: Y+M+D+n°ofLawThatDay

print $s -> scrape($uri);

