# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use Char::UHC;
print "1..1\n";

my $__FILE__ = __FILE__;

$a = "�A�\�A";
if ($a =~ s/(�A�\|�C�\)/$1<$1>/) {
    if ($1 eq "�A�\") {
        print qq{ok - 1 "�A�\�A" =~ s/(�A�\|�C�\)// \$1=($1) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 1 "�A�\�A" =~ s/(�A�\|�C�\)// \$1=($1) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 1 "�A�\�A" =~ s/(�A�\|�C�\)// \$1=($1) $^X $__FILE__\n};
}

__END__
