# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use strict;
use Char::UHC;
print "1..18\n";

my $__FILE__ = __FILE__;

$_ = 'A';
if ($_ =~ s'(A)'') {
    if ($1 eq 'A') {
        print qq{ok - 1 'A' =~ s'(A)'' 1:($1) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 1 'A' =~ s'(A)'' 2:($1) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 1 'A' =~ s'(A)'' 3:($1) $^X $__FILE__\n};
}

$_ = 'A';
if ($_ =~ s'(A)''b) {
    if ($1 eq 'A') {
        print qq{ok - 2 'A' =~ s'(A)''b $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 2 'A' =~ s'(A)''b $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 2 'A' =~ s'(A)''b $^X $__FILE__\n};
}

$_ = 'A';
if ($_ =~ s'(a)''i) {
    if ($1 eq 'A') {
        print qq{ok - 3 'A' =~ s'(a)''i $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 3 'A' =~ s'(a)''i $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 3 'A' =~ s'(a)''i $^X $__FILE__\n};
}

$_ = 'A';
if ($_ =~ s'(a)''ib) {
    if ($1 eq 'A') {
        print qq{ok - 4 'A' =~ s'(a)''ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 4 'A' =~ s'(a)''ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 4 'A' =~ s'(a)''ib $^X $__FILE__\n};
}

$_ = 'a';
if ($_ =~ s'(a)''i) {
    if ($1 eq 'a') {
        print qq{ok - 5 'a' =~ s'(a)''i $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 5 'a' =~ s'(a)''i $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 5 'a' =~ s'(a)''i $^X $__FILE__\n};
}

$_ = 'a';
if ($_ =~ s'(a)''ib) {
    if ($1 eq 'a') {
        print qq{ok - 6 'a' =~ s'(a)''ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 6 'a' =~ s'(a)''ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 6 'a' =~ s'(a)''ib $^X $__FILE__\n};
}

$_ = '�A';
if ($_ =~ s'(A)''b) {
    if ($1 eq 'A') {
        print qq{ok - 7 '�A' =~ s'(A)''b $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 7 '�A' =~ s'(A)''b $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 7 '�A' =~ s'(A)''b $^X $__FILE__\n};
}

$_ = '�A';
if ($_ =~ s'(A)''ib) {
    if ($1 eq 'A') {
        print qq{ok - 8 '�A' =~ s'(A)''ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 8 '�A' =~ s'(A)''ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 8 '�A' =~ s'(A)''ib $^X $__FILE__\n};
}

$_ = '�A';
if ($_ =~ s'(a)''ib) {
    if ($1 eq 'A') {
        print qq{ok - 9 '�A' =~ s'(a)''ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 9 '�A' =~ s'(a)''ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 9 '�A' =~ s'(a)''ib $^X $__FILE__\n};
}

$_ = '�a';
if ($_ =~ s'(A)''ib) {
    if ($1 eq 'a') {
        print qq{ok - 10 '�a' =~ s'(A)''ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 10 '�a' =~ s'(A)''ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 10 '�a' =~ s'(A)''ib $^X $__FILE__\n};
}

$_ = '�a';
if ($_ =~ s'(a)''b) {
    if ($1 eq 'a') {
        print qq{ok - 11 '�a' =~ s'(a)''b $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 11 '�a' =~ s'(a)''b $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 11 '�a' =~ s'(a)''b $^X $__FILE__\n};
}

$_ = '�a';
if ($_ =~ s'(a)''ib) {
    if ($1 eq 'a') {
        print qq{ok - 12 '�a' =~ s'(a)''ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 12 '�a' =~ s'(a)''ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 12 '�a' =~ s'(a)''ib $^X $__FILE__\n};
}

$_ = '��A';
if ($_ =~ s'(�A)''b) {
    if ($1 eq '�A') {
        print qq{ok - 13 '��A' =~ s'(�A)''b $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 13 '��A' =~ s'(�A)''b $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 13 '��A' =~ s'(�A)''b $^X $__FILE__\n};
}

$_ = '��A';
if ($_ =~ s'(�A)''ib) {
    if ($1 eq '�A') {
        print qq{ok - 14 '��A' =~ s'(�A)''ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 14 '��A' =~ s'(�A)''ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 14 '��A' =~ s'(�A)''ib $^X $__FILE__\n};
}

$_ = '��A';
if ($_ =~ s'(�a)''ib) {
    if ($1 eq '�A') {
        print qq{ok - 15 '��A' =~ s'(�a)''ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 15 '��A' =~ s'(�a)''ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 15 '��A' =~ s'(�a)''ib $^X $__FILE__\n};
}

$_ = '��a';
if ($_ =~ s'(�A)''ib) {
    if ($1 eq '�a') {
        print qq{ok - 16 '��a' =~ s'(�A)''ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 16 '��a' =~ s'(�A)''ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 16 '��a' =~ s'(�A)''ib $^X $__FILE__\n};
}

$_ = '��a';
if ($_ =~ s'(�a)''b) {
    if ($1 eq '�a') {
        print qq{ok - 17 '��a' =~ s'(�a)''b $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 17 '��a' =~ s'(�a)''b $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 17 '��a' =~ s'(�a)''b $^X $__FILE__\n};
}

$_ = '��a';
if ($_ =~ s'(�a)''ib) {
    if ($1 eq '�a') {
        print qq{ok - 18 '��a' =~ s'(�a)''ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 18 '��a' =~ s'(�a)''ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 18 '��a' =~ s'(�a)''ib $^X $__FILE__\n};
}

__END__

