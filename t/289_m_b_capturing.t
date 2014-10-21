# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use strict;
use Char::UHC;
print "1..18\n";

my $__FILE__ = __FILE__;

if ('A' =~ m/(A)/) {
    if ($1 eq 'A') {
        print qq{ok - 1 'A' =~ m/(A)/ $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 1 'A' =~ m/(A)/ $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 1 'A' =~ m/(A)/ $^X $__FILE__\n};
}

if ('A' =~ m/(A)/b) {
    if ($1 eq 'A') {
        print qq{ok - 2 'A' =~ m/(A)/b $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 2 'A' =~ m/(A)/b $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 2 'A' =~ m/(A)/b $^X $__FILE__\n};
}

if ('A' =~ m/(a)/i) {
    if ($1 eq 'A') {
        print qq{ok - 3 'A' =~ m/(a)/i $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 3 'A' =~ m/(a)/i $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 3 'A' =~ m/(a)/i $^X $__FILE__\n};
}

if ('A' =~ m/(a)/ib) {
    if ($1 eq 'A') {
        print qq{ok - 4 'A' =~ m/(a)/ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 4 'A' =~ m/(a)/ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 4 'A' =~ m/(a)/ib $^X $__FILE__\n};
}

if ('a' =~ m/(a)/i) {
    if ($1 eq 'a') {
        print qq{ok - 5 'a' =~ m/(a)/i $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 5 'a' =~ m/(a)/i $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 5 'a' =~ m/(a)/i $^X $__FILE__\n};
}

if ('a' =~ m/(a)/ib) {
    if ($1 eq 'a') {
        print qq{ok - 6 'a' =~ m/(a)/ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 6 'a' =~ m/(a)/ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 6 'a' =~ m/(a)/ib $^X $__FILE__\n};
}

if ('�A' =~ m/(A)/b) {
    if ($1 eq 'A') {
        print qq{ok - 7 '�A' =~ m/(A)/b $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 7 '�A' =~ m/(A)/b $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 7 '�A' =~ m/(A)/b $^X $__FILE__\n};
}

if ('�A' =~ m/(A)/ib) {
    if ($1 eq 'A') {
        print qq{ok - 8 '�A' =~ m/(A)/ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 8 '�A' =~ m/(A)/ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 8 '�A' =~ m/(A)/ib $^X $__FILE__\n};
}

if ('�A' =~ m/(a)/ib) {
    if ($1 eq 'A') {
        print qq{ok - 9 '�A' =~ m/(a)/ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 9 '�A' =~ m/(a)/ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 9 '�A' =~ m/(a)/ib $^X $__FILE__\n};
}

if ('�a' =~ m/(A)/ib) {
    if ($1 eq 'a') {
        print qq{ok - 10 '�a' =~ m/(A)/ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 10 '�a' =~ m/(A)/ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 10 '�a' =~ m/(A)/ib $^X $__FILE__\n};
}

if ('�a' =~ m/(a)/b) {
    if ($1 eq 'a') {
        print qq{ok - 11 '�a' =~ m/(a)/b $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 11 '�a' =~ m/(a)/b $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 11 '�a' =~ m/(a)/b $^X $__FILE__\n};
}

if ('�a' =~ m/(a)/ib) {
    if ($1 eq 'a') {
        print qq{ok - 12 '�a' =~ m/(a)/ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 12 '�a' =~ m/(a)/ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 12 '�a' =~ m/(a)/ib $^X $__FILE__\n};
}

if ('��A' =~ m/(�A)/b) {
    if ($1 eq '�A') {
        print qq{ok - 13 '��A' =~ m/(�A)/b $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 13 '��A' =~ m/(�A)/b $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 13 '��A' =~ m/(�A)/b $^X $__FILE__\n};
}

if ('��A' =~ m/(�A)/ib) {
    if ($1 eq '�A') {
        print qq{ok - 14 '��A' =~ m/(�A)/ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 14 '��A' =~ m/(�A)/ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 14 '��A' =~ m/(�A)/ib $^X $__FILE__\n};
}

if ('��A' =~ m/(�a)/ib) {
    if ($1 eq '�A') {
        print qq{ok - 15 '��A' =~ m/(�a)/ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 15 '��A' =~ m/(�a)/ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 15 '��A' =~ m/(�a)/ib $^X $__FILE__\n};
}

if ('��a' =~ m/(�A)/ib) {
    if ($1 eq '�a') {
        print qq{ok - 16 '��a' =~ m/(�A)/ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 16 '��a' =~ m/(�A)/ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 16 '��a' =~ m/(�A)/ib $^X $__FILE__\n};
}

if ('��a' =~ m/(�a)/b) {
    if ($1 eq '�a') {
        print qq{ok - 17 '��a' =~ m/(�a)/b $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 17 '��a' =~ m/(�a)/b $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 17 '��a' =~ m/(�a)/b $^X $__FILE__\n};
}

if ('��a' =~ m/(�a)/ib) {
    if ($1 eq '�a') {
        print qq{ok - 18 '��a' =~ m/(�a)/ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 18 '��a' =~ m/(�a)/ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 18 '��a' =~ m/(�a)/ib $^X $__FILE__\n};
}

__END__

