#!/usr/bin/perl
use strict;
use warnings;
#
# This script will fetch all the numbers of the laws so we can download them from the next site using this url: http://www.ejustice.just.fgov.be/cgi_loi/change_lg.pl?language=nl&la=N&table_name=wet&cn=2010042801
#
#
# Disclaimer: You should not use this script. It is here for educational purpose only. It will generate a serious amount of traffic to fgov.be.
#
# Author: Pieter Colpaert
# (c) 2011 iRail vzw/asbl
# license: AGPL
#
use Web::Scraper;
use URI;

my $s = scraper {
  process "",
};

