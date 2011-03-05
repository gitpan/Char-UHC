# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{あ} ne "\x82\xa0";

use Char::UHC;
print "1..1\n";

my $__FILE__ = __FILE__;

$a = "アソア";
if ($a !~ s/^ソ//) {
    print qq{ok - 1 "アソア" !~ s/^ソ// $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 "アソア" !~ s/^ソ// $^X $__FILE__\n};
}

__END__
