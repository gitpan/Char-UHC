# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{あ} ne "\x82\xa0";

use Char::UHC;
print "1..1\n";

my $__FILE__ = __FILE__;

if ('ああう' =~ /(あ[い-え])/) {
    if ("$1" eq "あう") {
        print "ok - 1 $^X $__FILE__ ('ああう' =~ /あ[い-え]/).\n";
    }
    else {
        print "not ok - 1 $^X $__FILE__ ('ああう' =~ /あ[い-え]/).\n";
    }
}
else {
    print "not ok - 1 $^X $__FILE__ ('ああう' =~ /あ[い-え]/).\n";
}

__END__
