#!/bin/bash
#
# This script updates the system with the latest laws
#
# Author: Pieter Colpaert
# (c) 2011 iRail vzw/asbl
# license: AGPL
#
# usage: bash fetcher.sh < results
#

#set to today
y=$(( $(date +%Y) +0 ))
m=$(( $(date +%m) + 0 ))
d=$(( $(date +%d) +0 ))
n=1

#add a leading 0 if the number is less than 10
[ $n -lt 10 ] && ns=0$n || ns=$n; 
[ $d -lt 10 ] && ds=0$d || ds=$d;
[ $m -lt 10 ] && ms=0$m || ms=$m;
#with cn we're doing the request: concatenation of all parameters
cn=$y$ms$ds$ns;

#as long as we havent reached the last day, we're ok
while [ $cn.html != $(ls laws|tail -n 1) ] ; do {
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
