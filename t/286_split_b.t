# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use strict;
use Char::UHC;
print "1..56\n";

my $__FILE__ = __FILE__;

my @split = ();

@split = split(qr/A/, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 1 split(qr/A/, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 split(qr/A/, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/a/i, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 2 split(qr/a/i, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 2 split(qr/a/i, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/A/, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 3 split(qr/A/, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 3 split(qr/A/, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/a/i, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 4 split(qr/a/i, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 4 split(qr/a/i, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�A/, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 5 split(qr/�A/, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 5 split(qr/�A/, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�A/i, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 6 split(qr/�A/i, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 6 split(qr/�A/i, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�a/, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 7 split(qr/�a/, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 7 split(qr/�a/, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�a/i, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 8 split(qr/�a/i, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 8 split(qr/�a/i, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�A/, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 9 split(qr/�A/, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 9 split(qr/�A/, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�A/i, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 10 split(qr/�A/i, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 10 split(qr/�A/i, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�a/, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 11 split(qr/�a/, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 11 split(qr/�a/, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�a/i, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 12 split(qr/�a/i, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 12 split(qr/�a/i, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/A/, join('�A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 13 split(qr/A/, join('�A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 13 split(qr/A/, join('�A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/A/i, join('�A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 14 split(qr/A/i, join('�A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 14 split(qr/A/i, join('�A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/a/, join('�A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 15 split(qr/a/, join('�A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 15 split(qr/a/, join('�A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/a/i, join('�A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 16 split(qr/a/i, join('�A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 16 split(qr/a/i, join('�A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/A/, join('�a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 17 split(qr/A/, join('�a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 17 split(qr/A/, join('�a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/A/i, join('�a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 18 split(qr/A/i, join('�a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 18 split(qr/A/i, join('�a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/a/, join('�a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 19 split(qr/a/, join('�a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 19 split(qr/a/, join('�a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/a/i, join('�a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 20 split(qr/a/i, join('�a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 20 split(qr/a/i, join('�a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�A/, join('��A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 21 split(qr/�A/, join('��A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 21 split(qr/�A/, join('��A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�A/i, join('��A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 22 split(qr/�A/i, join('��A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 22 split(qr/�A/i, join('��A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�a/, join('��A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 23 split(qr/�a/, join('��A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 23 split(qr/�a/, join('��A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�a/i, join('��A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 24 split(qr/�a/i, join('��A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 24 split(qr/�a/i, join('��A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�A/, join('��a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 25 split(qr/�A/, join('��a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 25 split(qr/�A/, join('��a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�A/i, join('��a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 26 split(qr/�A/i, join('��a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 26 split(qr/�A/i, join('��a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�a/, join('��a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 27 split(qr/�a/, join('��a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 27 split(qr/�a/, join('��a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�a/i, join('��a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 28 split(qr/�a/i, join('��a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 28 split(qr/�a/i, join('��a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/A/b, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 29 split(qr/A/b, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 29 split(qr/A/b, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/A/b, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 30 split(qr/A/b, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 30 split(qr/A/b, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�A/b, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 31 split(qr/�A/b, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 31 split(qr/�A/b, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�a/b, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 32 split(qr/�a/b, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 32 split(qr/�a/b, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�A/b, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 33 split(qr/�A/b, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 33 split(qr/�A/b, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�a/b, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 34 split(qr/�a/b, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 34 split(qr/�a/b, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/A/b, join('�A', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 35 split(qr/A/b, join('�A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 35 split(qr/A/b, join('�A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/a/b, join('�A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 36 split(qr/a/b, join('�A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 36 split(qr/a/b, join('�A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/A/b, join('�a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 37 split(qr/A/b, join('�a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 37 split(qr/A/b, join('�a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/a/b, join('�a', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 38 split(qr/a/b, join('�a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 38 split(qr/a/b, join('�a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�A/b, join('��A', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 39 split(qr/�A/b, join('��A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 39 split(qr/�A/b, join('��A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�a/b, join('��A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 40 split(qr/�a/b, join('��A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 40 split(qr/�a/b, join('��A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�A/b, join('��a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 41 split(qr/�A/b, join('��a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 41 split(qr/�A/b, join('��a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�a/b, join('��a', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 42 split(qr/�a/b, join('��a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 42 split(qr/�a/b, join('��a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/a/ib, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 43 split(qr/a/ib, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 43 split(qr/a/ib, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/a/ib, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 44 split(qr/a/ib, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 44 split(qr/a/ib, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�A/ib, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 45 split(qr/�A/ib, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 45 split(qr/�A/ib, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�a/ib, join('A', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 46 split(qr/�a/ib, join('A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 46 split(qr/�a/ib, join('A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�A/ib, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 47 split(qr/�A/ib, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 47 split(qr/�A/ib, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�a/ib, join('a', 1..10));
if (scalar(@split) == 10) {
    print qq{not ok - 48 split(qr/�a/ib, join('a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{ok - 48 split(qr/�a/ib, join('a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/A/ib, join('�A', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 49 split(qr/A/ib, join('�A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 49 split(qr/A/ib, join('�A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/a/ib, join('�A', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 50 split(qr/a/ib, join('�A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 50 split(qr/a/ib, join('�A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/A/ib, join('�a', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 51 split(qr/A/ib, join('�a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 51 split(qr/A/ib, join('�a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/a/ib, join('�a', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 52 split(qr/a/ib, join('�a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 52 split(qr/a/ib, join('�a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�A/ib, join('��A', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 53 split(qr/�A/ib, join('��A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 53 split(qr/�A/ib, join('��A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�a/ib, join('��A', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 54 split(qr/�a/ib, join('��A', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 54 split(qr/�a/ib, join('��A', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�A/ib, join('��a', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 55 split(qr/�A/ib, join('��a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 55 split(qr/�A/ib, join('��a', 1..10)) $^X $__FILE__\n};
}

@split = split(qr/�a/ib, join('��a', 1..10));
if (scalar(@split) == 10) {
    print qq{ok - 56 split(qr/�a/ib, join('��a', 1..10)) $^X $__FILE__\n};
}
else {
    print qq{not ok - 56 split(qr/�a/ib, join('��a', 1..10)) $^X $__FILE__\n};
}

__END__

