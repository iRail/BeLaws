#!/bin/perl
use strict;
use warnings;

use Web::Scraper;
use URI;

my $s = scraper {
  process "",
};

my $uri = URI->new("http://www.ejustice.just.fgov.be/cgi_loi/loi_a1.pl?language=nl&fromtab=wet_all&sql=cc+not+contains+%27foobar%27&caller=image_a1&cn=2010042801");

#
# Example URL:
#
# http://www.ejustice.just.fgov.be/cgi_loi/
# loi_a1.pl?language=nl
# &fromtab=wet_all
# &sql=cc+not+contains+'foobar'
# &caller=image_a1
##&cn=2010042801 → ONLY IMPORTANT VALUE
#
# cn is a lawID built like this: Y+M+D+n°ofLawThatDay

print $s -> scrape($uri);


