# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{あ} ne "\x82\xa0";

use Char::UHC;
print "1..1\n";

my $__FILE__ = __FILE__;

if ('あeえ' =~ /(あ[^いう]え)/) {
    if ("$1" eq "あeえ") {
        print "ok - 1 $^X $__FILE__ ('あeえ' =~ /あ[^いう]え/).\n";
    }
    else {
        print "not ok - 1 $^X $__FILE__ ('あeえ' =~ /あ[^いう]え/).\n";
    }
}
else {
    print "not ok - 1 $^X $__FILE__ ('あeえ' =~ /あ[^いう]え/).\n";
}

__END__
