use strict;
use File::Basename;
use lib dirname(__FILE__);

use Test::More;
BEGIN {
  if ( qr/x/ =~ /\(\?\^/ ){
    plan skip_all => "test only for perls before v5.13.5-11-gfb85c04";
  }
}
use TestYAML tests => 1;

no_diff();
run_roundtrip_nyn('dumper');

__DATA__
===
+++ no_round_trip
Since we don't use eval for regexp reconstitution any more (for safety
sake) this test doesn't roundtrip even though the values are equivalent.
+++ perl
[qr{bozo$}i]
+++ yaml
---
- !!perl/regexp (?i-xsm:bozo$)

