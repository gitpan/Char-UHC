# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use strict;
use Char::UHC;
print "1..56\n";

my $__FILE__ = __FILE__;

my @split = ();

@split = split(/A/, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 1 split(/A/, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 split(/A/, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(/a/i, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 2 split(/a/i, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 2 split(/a/i, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(/A/, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 3 split(/A/, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 3 split(/A/, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(/a/i, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 4 split(/a/i, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 4 split(/a/i, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(/�A/, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 5 split(/�A/, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 5 split(/�A/, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(/�A/i, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 6 split(/�A/i, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 6 split(/�A/i, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(/�a/, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 7 split(/�a/, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 7 split(/�a/, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(/�a/i, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 8 split(/�a/i, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 8 split(/�a/i, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(/�A/, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 9 split(/�A/, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 9 split(/�A/, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(/�A/i, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 10 split(/�A/i, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 10 split(/�A/i, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(/�a/, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 11 split(/�a/, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 11 split(/�a/, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(/�a/i, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 12 split(/�a/i, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 12 split(/�a/i, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(/A/, join('�A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 13 split(/A/, join('�A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 13 split(/A/, join('�A', 1..10)) $^X $__FILE__\n};
}

@split = split(/A/i, join('�A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 14 split(/A/i, join('�A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 14 split(/A/i, join('�A', 1..10)) $^X $__FILE__\n};
}

@split = split(/a/, join('�A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 15 split(/a/, join('�A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 15 split(/a/, join('�A', 1..10)) $^X $__FILE__\n};
}

@split = split(/a/i, join('�A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 16 split(/a/i, join('�A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 16 split(/a/i, join('�A', 1..10)) $^X $__FILE__\n};
}

@split = split(/A/, join('�a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 17 split(/A/, join('�a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 17 split(/A/, join('�a', 1..10)) $^X $__FILE__\n};
}

@split = split(/A/i, join('�a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 18 split(/A/i, join('�a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 18 split(/A/i, join('�a', 1..10)) $^X $__FILE__\n};
}

@split = split(/a/, join('�a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 19 split(/a/, join('�a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 19 split(/a/, join('�a', 1..10)) $^X $__FILE__\n};
}

@split = split(/a/i, join('�a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 20 split(/a/i, join('�a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 20 split(/a/i, join('�a', 1..10)) $^X $__FILE__\n};
}

@split = split(/�A/, join('��A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 21 split(/�A/, join('��A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 21 split(/�A/, join('��A', 1..10)) $^X $__FILE__\n};
}

@split = split(/�A/i, join('��A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 22 split(/�A/i, join('��A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 22 split(/�A/i, join('��A', 1..10)) $^X $__FILE__\n};
}

@split = split(/�a/, join('��A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 23 split(/�a/, join('��A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 23 split(/�a/, join('��A', 1..10)) $^X $__FILE__\n};
}

@split = split(/�a/i, join('��A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 24 split(/�a/i, join('��A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 24 split(/�a/i, join('��A', 1..10)) $^X $__FILE__\n};
}

@split = split(/�A/, join('��a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 25 split(/�A/, join('��a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 25 split(/�A/, join('��a', 1..10)) $^X $__FILE__\n};
}

@split = split(/�A/i, join('��a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 26 split(/�A/i, join('��a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 26 split(/�A/i, join('��a', 1..10)) $^X $__FILE__\n};
}

@split = split(/�a/, join('��a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 27 split(/�a/, join('��a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 27 split(/�a/, join('��a', 1..10)) $^X $__FILE__\n};
}

@split = split(/�a/i, join('��a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 28 split(/�a/i, join('��a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 28 split(/�a/i, join('��a', 1..10)) $^X $__FILE__\n};
}

@split = split(/A/b, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 29 split(/A/b, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 29 split(/A/b, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(/A/b, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 30 split(/A/b, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 30 split(/A/b, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(/�A/b, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 31 split(/�A/b, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 31 split(/�A/b, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(/�a/b, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 32 split(/�a/b, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 32 split(/�a/b, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(/�A/b, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 33 split(/�A/b, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 33 split(/�A/b, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(/�a/b, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 34 split(/�a/b, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 34 split(/�a/b, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(/A/b, join('�A', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 35 split(/A/b, join('�A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 35 split(/A/b, join('�A', 1..10)) $^X $__FILE__\n};
}

@split = split(/a/b, join('�A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 36 split(/a/b, join('�A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 36 split(/a/b, join('�A', 1..10)) $^X $__FILE__\n};
}

@split = split(/A/b, join('�a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 37 split(/A/b, join('�a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 37 split(/A/b, join('�a', 1..10)) $^X $__FILE__\n};
}

@split = split(/a/b, join('�a', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 38 split(/a/b, join('�a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 38 split(/a/b, join('�a', 1..10)) $^X $__FILE__\n};
}

@split = split(/�A/b, join('��A', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 39 split(/�A/b, join('��A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 39 split(/�A/b, join('��A', 1..10)) $^X $__FILE__\n};
}

@split = split(/�a/b, join('��A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 40 split(/�a/b, join('��A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 40 split(/�a/b, join('��A', 1..10)) $^X $__FILE__\n};
}

@split = split(/�A/b, join('��a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 41 split(/�A/b, join('��a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 41 split(/�A/b, join('��a', 1..10)) $^X $__FILE__\n};
}

@split = split(/�a/b, join('��a', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 42 split(/�a/b, join('��a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 42 split(/�a/b, join('��a', 1..10)) $^X $__FILE__\n};
}

@split = split(/a/ib, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 43 split(/a/ib, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 43 split(/a/ib, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(/a/ib, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 44 split(/a/ib, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 44 split(/a/ib, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(/�A/ib, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 45 split(/�A/ib, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 45 split(/�A/ib, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(/�a/ib, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 46 split(/�a/ib, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 46 split(/�a/ib, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(/�A/ib, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 47 split(/�A/ib, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 47 split(/�A/ib, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(/�a/ib, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 48 split(/�a/ib, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 48 split(/�a/ib, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(/A/ib, join('�A', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 49 split(/A/ib, join('�A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 49 split(/A/ib, join('�A', 1..10)) $^X $__FILE__\n};
}

@split = split(/a/ib, join('�A', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 50 split(/a/ib, join('�A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 50 split(/a/ib, join('�A', 1..10)) $^X $__FILE__\n};
}

@split = split(/A/ib, join('�a', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 51 split(/A/ib, join('�a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 51 split(/A/ib, join('�a', 1..10)) $^X $__FILE__\n};
}

@split = split(/a/ib, join('�a', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 52 split(/a/ib, join('�a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 52 split(/a/ib, join('�a', 1..10)) $^X $__FILE__\n};
}

@split = split(/�A/ib, join('��A', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 53 split(/�A/ib, join('��A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 53 split(/�A/ib, join('��A', 1..10)) $^X $__FILE__\n};
}

@split = split(/�a/ib, join('��A', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 54 split(/�a/ib, join('��A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 54 split(/�a/ib, join('��A', 1..10)) $^X $__FILE__\n};
}

@split = split(/�A/ib, join('��a', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 55 split(/�A/ib, join('��a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 55 split(/�A/ib, join('��a', 1..10)) $^X $__FILE__\n};
}

@split = split(/�a/ib, join('��a', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 56 split(/�a/ib, join('��a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 56 split(/�a/ib, join('��a', 1..10)) $^X $__FILE__\n};
}

__END__

