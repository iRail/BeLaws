#!/usr/bin/perl
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
use strict;
use warnings;
use Web::Scraper;
use URI;

my $s = scraper {
  process '//input[@name="cn"]', 'cn[]' => '@value';
};

my $i = 0; #page
my $go_on = 1; #go on boolean
my $rowid = 0;
while($go_on){
  $rowid=$i*30+1;
  my $uri = URI->new("http://www.ejustice.just.fgov.be/cgi_loi/loi_l1.pl?row_id=". $rowid ."&language=nl&sql=dt+not+contains++'FOO'&fromtab=wet_all&tri=dd+AS+RANK+&rech=30&caller=list");
  my @results = @{$s->scrape($uri)->{"cn"}};
  foreach(@results) {
    print "$_\n";
  }
  $go_on = 0 unless(@results);
  $i++;
}
