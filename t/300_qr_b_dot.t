# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use strict;
use Char::UHC;
print "1..2\n";

my $__FILE__ = __FILE__;

if ('��' =~ qr/(.)/b) {
    if (length($1) == 1) {
        print qq{ok - 1 '��'=~qr/(.)/b; length(\$1)==1 $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 1 '��'=~qr/(.)/b; length(\$1)==1 $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 1 '��'=~qr/(.)/b; length(\$1)==1 $^X $__FILE__\n};
}

if ('��' =~ qr'(.)'b) {
    if (length($1) == 1) {
        print qq{ok - 2 '��'=~qr'(.)'b; length(\$1)==1 $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 2 '��'=~qr'(.)'b; length(\$1)==1 $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 2 '��'=~qr'(.)'b; length(\$1)==1 $^X $__FILE__\n};
}

__END__

