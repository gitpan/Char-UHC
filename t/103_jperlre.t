# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{あ} ne "\x82\xa0";

use Char::UHC;
print "1..1\n";

my $__FILE__ = __FILE__;

if ('xいう' =~ /(あいう)/) {
    print "not ok - 1 $^X $__FILE__ not ('xいう' =~ /あいう/).\n";
}
else {
    print "ok - 1 $^X $__FILE__ not ('xいう' =~ /あいう/).\n";
}

__END__
