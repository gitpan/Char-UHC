# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

my $__FILE__ = __FILE__;

use 5.00503;
use Char::UHC;
print "1..1\n";

print "ok - 1 $^X $__FILE__\n";

__END__
