# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{あ} ne "\x82\xa0";

use Char::UHC;
print "1..2\n";

my $__FILE__ = __FILE__;

open(FILE,">$__FILE__.txt") || die;
print FILE <DATA>;
close(FILE);

open(GETC,"<$__FILE__.txt") || die;
my @getc = ();
while (my $c = Char::UHC::getc(GETC)) {
    last if $c =~ /\A[\r\n]\z/;
    push @getc, $c;
}
close(GETC);

my $result = join('', map {"($_)"} @getc);
if ($result eq '(1)(2)(あ)(い)') {
    print "ok - 1 $^X $__FILE__ 12あい --> $result.\n";
}
else {
    print "not ok - 1 $^X $__FILE__ 12あい --> $result.\n";
}

{
    package Getc::Test;

    open(GETC2,"<$__FILE__.txt") || die;
    my @getc = ();
    while (my $c = Char::UHC::getc(GETC2)) {
        last if $c =~ /\A[\r\n]\z/;
        push @getc, $c;
    }
    close(GETC2);

    my $result = join('', map {"($_)"} @getc);
    if ($result eq '(1)(2)(あ)(い)') {
        print "ok - 2 $^X $__FILE__ 12あい --> $result.\n";
    }
    else {
        print "not ok - 2 $^X $__FILE__ 12あい --> $result.\n";
    }
}

unlink("$__FILE__.txt");

__END__
12あい
