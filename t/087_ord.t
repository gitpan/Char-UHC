# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{‚ } ne "\x82\xa0";

use Char::UHC;
print "1..2\n";

my $__FILE__ = __FILE__;

if (Char::UHC::ord('‚ ') == 0x82A0) {
    print qq{ok - 1 Char::UHC::ord('‚ ') == 0x82A0 $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 Char::UHC::ord('‚ ') == 0x82A0 $^X $__FILE__\n};
}

$_ = '‚¢';
if (Char::UHC::ord == 0x82A2) {
    print qq{ok - 2 \$_ = '‚¢'; Char::UHC::ord() == 0x82A2 $^X $__FILE__\n};
}
else {
    print qq{not ok - 2 \$_ = '‚¢'; Char::UHC::ord() == 0x82A2 $^X $__FILE__\n};
}

__END__
