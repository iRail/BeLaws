#!/bin/bash
#
# This script will fetch all the html pages and stores them in a directory. It will try to search any date. If it finds laws it will increment the index. When an error is returned, we will go on to the next day
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
y=2011
m=2
d=11
n=1

#as far as I know 1831 is the year Belgium was founded and no laws are made before that
while [ $y -gt 1831 ] ; do {
	#add a leading 0 if the number is less than 10
	[ $n -lt 10 ] && ns=0$n || ns=$n; 
	[ $d -lt 10 ] && ds=0$d || ds=$d;
	[ $m -lt 10 ] && ms=0$m || ms=$m;
	
	#with cn we're doing the request: concatenation of all parameters
	cn=$y$ms$ds$ns;
	
#download the file and save it
	wget "http://www.ejustice.just.fgov.be/cgi_loi/loi_a1.pl?caller=list&cn=$cn&la=N&sql=dt+not+contains+'foo'&language=nl&chercher=t&fromtab=wet_all" -O laws/$cn.html ;
	#if it does not contain a law, remove it, otherwise, increment te number
	if grep "No article available" laws/$cn.html
	then 
	    rm laws/$cn.html;
	    ((n=1));
	    ((d--));
	    [ $d -eq 0 ] && { d=31; ((m--)); }
	    [ $m -eq 0 ] && { m=12; ((y--)); }
	else 
	    ((n++));
	fi
	
} done


# cn is a lawID built like this: Y+M+D+n°ofLawThatDay
