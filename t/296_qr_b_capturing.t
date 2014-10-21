# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use strict;
use Char::UHC;
print "1..18\n";

my $__FILE__ = __FILE__;

if ('A' =~ qr'(A)') {
    if ($1 eq 'A') {
        print qq{ok - 1 'A' =~ qr'(A)' $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 1 'A' =~ qr'(A)' $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 1 'A' =~ qr'(A)' $^X $__FILE__\n};
}

if ('A' =~ qr'(A)'b) {
    if ($1 eq 'A') {
        print qq{ok - 2 'A' =~ qr'(A)'b $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 2 'A' =~ qr'(A)'b $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 2 'A' =~ qr'(A)'b $^X $__FILE__\n};
}

if ('A' =~ qr'(a)'i) {
    if ($1 eq 'A') {
        print qq{ok - 3 'A' =~ qr'(a)'i $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 3 'A' =~ qr'(a)'i $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 3 'A' =~ qr'(a)'i $^X $__FILE__\n};
}

if ('A' =~ qr'(a)'ib) {
    if ($1 eq 'A') {
        print qq{ok - 4 'A' =~ qr'(a)'ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 4 'A' =~ qr'(a)'ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 4 'A' =~ qr'(a)'ib $^X $__FILE__\n};
}

if ('a' =~ qr'(a)'i) {
    if ($1 eq 'a') {
        print qq{ok - 5 'a' =~ qr'(a)'i $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 5 'a' =~ qr'(a)'i $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 5 'a' =~ qr'(a)'i $^X $__FILE__\n};
}

if ('a' =~ qr'(a)'ib) {
    if ($1 eq 'a') {
        print qq{ok - 6 'a' =~ qr'(a)'ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 6 'a' =~ qr'(a)'ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 6 'a' =~ qr'(a)'ib $^X $__FILE__\n};
}

if ('�A' =~ qr'(A)'b) {
    if ($1 eq 'A') {
        print qq{ok - 7 '�A' =~ qr'(A)'b $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 7 '�A' =~ qr'(A)'b $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 7 '�A' =~ qr'(A)'b $^X $__FILE__\n};
}

if ('�A' =~ qr'(A)'ib) {
    if ($1 eq 'A') {
        print qq{ok - 8 '�A' =~ qr'(A)'ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 8 '�A' =~ qr'(A)'ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 8 '�A' =~ qr'(A)'ib $^X $__FILE__\n};
}

if ('�A' =~ qr'(a)'ib) {
    if ($1 eq 'A') {
        print qq{ok - 9 '�A' =~ qr'(a)'ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 9 '�A' =~ qr'(a)'ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 9 '�A' =~ qr'(a)'ib $^X $__FILE__\n};
}

if ('�a' =~ qr'(A)'ib) {
    if ($1 eq 'a') {
        print qq{ok - 10 '�a' =~ qr'(A)'ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 10 '�a' =~ qr'(A)'ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 10 '�a' =~ qr'(A)'ib $^X $__FILE__\n};
}

if ('�a' =~ qr'(a)'b) {
    if ($1 eq 'a') {
        print qq{ok - 11 '�a' =~ qr'(a)'b $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 11 '�a' =~ qr'(a)'b $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 11 '�a' =~ qr'(a)'b $^X $__FILE__\n};
}

if ('�a' =~ qr'(a)'ib) {
    if ($1 eq 'a') {
        print qq{ok - 12 '�a' =~ qr'(a)'ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 12 '�a' =~ qr'(a)'ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 12 '�a' =~ qr'(a)'ib $^X $__FILE__\n};
}

if ('��A' =~ qr'(�A)'b) {
    if ($1 eq '�A') {
        print qq{ok - 13 '��A' =~ qr'(�A)'b $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 13 '��A' =~ qr'(�A)'b $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 13 '��A' =~ qr'(�A)'b $^X $__FILE__\n};
}

if ('��A' =~ qr'(�A)'ib) {
    if ($1 eq '�A') {
        print qq{ok - 14 '��A' =~ qr'(�A)'ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 14 '��A' =~ qr'(�A)'ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 14 '��A' =~ qr'(�A)'ib $^X $__FILE__\n};
}

if ('��A' =~ qr'(�a)'ib) {
    if ($1 eq '�A') {
        print qq{ok - 15 '��A' =~ qr'(�a)'ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 15 '��A' =~ qr'(�a)'ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 15 '��A' =~ qr'(�a)'ib $^X $__FILE__\n};
}

if ('��a' =~ qr'(�A)'ib) {
    if ($1 eq '�a') {
        print qq{ok - 16 '��a' =~ qr'(�A)'ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 16 '��a' =~ qr'(�A)'ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 16 '��a' =~ qr'(�A)'ib $^X $__FILE__\n};
}

if ('��a' =~ qr'(�a)'b) {
    if ($1 eq '�a') {
        print qq{ok - 17 '��a' =~ qr'(�a)'b $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 17 '��a' =~ qr'(�a)'b $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 17 '��a' =~ qr'(�a)'b $^X $__FILE__\n};
}

if ('��a' =~ qr'(�a)'ib) {
    if ($1 eq '�a') {
        print qq{ok - 18 '��a' =~ qr'(�a)'ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 18 '��a' =~ qr'(�a)'ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 18 '��a' =~ qr'(�a)'ib $^X $__FILE__\n};
}

__END__

