# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use strict;
use Char::UHC;
print "1..18\n";

my $__FILE__ = __FILE__;

if ('A' =~ ?(A)?) {
    if ($1 eq 'A') {
        print qq{ok - 1 'A' =~ ?(A)? $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 1 'A' =~ ?(A)? $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 1 'A' =~ ?(A)? $^X $__FILE__\n};
}

if ('A' =~ ?(A)?b) {
    if ($1 eq 'A') {
        print qq{ok - 2 'A' =~ ?(A)?b $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 2 'A' =~ ?(A)?b $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 2 'A' =~ ?(A)?b $^X $__FILE__\n};
}

if ('A' =~ ?(a)?i) {
    if ($1 eq 'A') {
        print qq{ok - 3 'A' =~ ?(a)?i $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 3 'A' =~ ?(a)?i $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 3 'A' =~ ?(a)?i $^X $__FILE__\n};
}

if ('A' =~ ?(a)?ib) {
    if ($1 eq 'A') {
        print qq{ok - 4 'A' =~ ?(a)?ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 4 'A' =~ ?(a)?ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 4 'A' =~ ?(a)?ib $^X $__FILE__\n};
}

if ('a' =~ ?(a)?i) {
    if ($1 eq 'a') {
        print qq{ok - 5 'a' =~ ?(a)?i $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 5 'a' =~ ?(a)?i $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 5 'a' =~ ?(a)?i $^X $__FILE__\n};
}

if ('a' =~ ?(a)?ib) {
    if ($1 eq 'a') {
        print qq{ok - 6 'a' =~ ?(a)?ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 6 'a' =~ ?(a)?ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 6 'a' =~ ?(a)?ib $^X $__FILE__\n};
}

if ('�A' =~ ?(A)?b) {
    if ($1 eq 'A') {
        print qq{ok - 7 '�A' =~ ?(A)?b $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 7 '�A' =~ ?(A)?b $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 7 '�A' =~ ?(A)?b $^X $__FILE__\n};
}

if ('�A' =~ ?(A)?ib) {
    if ($1 eq 'A') {
        print qq{ok - 8 '�A' =~ ?(A)?ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 8 '�A' =~ ?(A)?ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 8 '�A' =~ ?(A)?ib $^X $__FILE__\n};
}

if ('�A' =~ ?(a)?ib) {
    if ($1 eq 'A') {
        print qq{ok - 9 '�A' =~ ?(a)?ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 9 '�A' =~ ?(a)?ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 9 '�A' =~ ?(a)?ib $^X $__FILE__\n};
}

if ('�a' =~ ?(A)?ib) {
    if ($1 eq 'a') {
        print qq{ok - 10 '�a' =~ ?(A)?ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 10 '�a' =~ ?(A)?ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 10 '�a' =~ ?(A)?ib $^X $__FILE__\n};
}

if ('�a' =~ ?(a)?b) {
    if ($1 eq 'a') {
        print qq{ok - 11 '�a' =~ ?(a)?b $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 11 '�a' =~ ?(a)?b $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 11 '�a' =~ ?(a)?b $^X $__FILE__\n};
}

if ('�a' =~ ?(a)?ib) {
    if ($1 eq 'a') {
        print qq{ok - 12 '�a' =~ ?(a)?ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 12 '�a' =~ ?(a)?ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 12 '�a' =~ ?(a)?ib $^X $__FILE__\n};
}

if ('��A' =~ ?(�A)?b) {
    if ($1 eq '�A') {
        print qq{ok - 13 '��A' =~ ?(�A)?b $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 13 '��A' =~ ?(�A)?b $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 13 '��A' =~ ?(�A)?b $^X $__FILE__\n};
}

if ('��A' =~ ?(�A)?ib) {
    if ($1 eq '�A') {
        print qq{ok - 14 '��A' =~ ?(�A)?ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 14 '��A' =~ ?(�A)?ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 14 '��A' =~ ?(�A)?ib $^X $__FILE__\n};
}

if ('��A' =~ ?(�a)?ib) {
    if ($1 eq '�A') {
        print qq{ok - 15 '��A' =~ ?(�a)?ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 15 '��A' =~ ?(�a)?ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 15 '��A' =~ ?(�a)?ib $^X $__FILE__\n};
}

if ('��a' =~ ?(�A)?ib) {
    if ($1 eq '�a') {
        print qq{ok - 16 '��a' =~ ?(�A)?ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 16 '��a' =~ ?(�A)?ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 16 '��a' =~ ?(�A)?ib $^X $__FILE__\n};
}

if ('��a' =~ ?(�a)?b) {
    if ($1 eq '�a') {
        print qq{ok - 17 '��a' =~ ?(�a)?b $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 17 '��a' =~ ?(�a)?b $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 17 '��a' =~ ?(�a)?b $^X $__FILE__\n};
}

if ('��a' =~ ?(�a)?ib) {
    if ($1 eq '�a') {
        print qq{ok - 18 '��a' =~ ?(�a)?ib $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 18 '��a' =~ ?(�a)?ib $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 18 '��a' =~ ?(�a)?ib $^X $__FILE__\n};
}

__END__

