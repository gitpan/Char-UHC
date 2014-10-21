# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use strict;
use Char::UHC;
print "1..56\n";

my $__FILE__ = __FILE__;

if ('A' =~ /A/) {
    print qq{ok - 1 'A' =~ /A/ $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 'A' =~ /A/ $^X $__FILE__\n};
}

if ('A' =~ /A/b) {
    print qq{ok - 2 'A' =~ /A/b $^X $__FILE__\n};
}
else {
    print qq{not ok - 2 'A' =~ /A/b $^X $__FILE__\n};
}

if ('A' =~ /a/i) {
    print qq{ok - 3 'A' =~ /a/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 3 'A' =~ /a/i $^X $__FILE__\n};
}

if ('A' =~ /a/ib) {
    print qq{ok - 4 'A' =~ /a/ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 4 'A' =~ /a/ib $^X $__FILE__\n};
}

if ('a' =~ /A/) {
    print qq{not ok - 5 'a' =~ /A/ $^X $__FILE__\n};
}
else {
    print qq{ok - 5 'a' =~ /A/ $^X $__FILE__\n};
}

if ('a' =~ /A/b) {
    print qq{not ok - 6 'a' =~ /A/b $^X $__FILE__\n};
}
else {
    print qq{ok - 6 'a' =~ /A/b $^X $__FILE__\n};
}

if ('a' =~ /a/i) {
    print qq{ok - 7 'a' =~ /a/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 7 'a' =~ /a/i $^X $__FILE__\n};
}

if ('a' =~ /a/ib) {
    print qq{ok - 8 'a' =~ /a/ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 8 'a' =~ /a/ib $^X $__FILE__\n};
}

if ('A' =~ /�A/) {
    print qq{not ok - 9 'A' =~ /�A/ $^X $__FILE__\n};
}
else {
    print qq{ok - 9 'A' =~ /�A/ $^X $__FILE__\n};
}

if ('A' =~ /�A/b) {
    print qq{not ok - 10 'A' =~ /�A/b $^X $__FILE__\n};
}
else {
    print qq{ok - 10 'A' =~ /�A/b $^X $__FILE__\n};
}

if ('A' =~ /�A/i) {
    print qq{not ok - 11 'A' =~ /�A/i $^X $__FILE__\n};
}
else {
    print qq{ok - 11 'A' =~ /�A/i $^X $__FILE__\n};
}

if ('A' =~ /�A/ib) {
    print qq{not ok - 12 'A' =~ /�A/ib $^X $__FILE__\n};
}
else {
    print qq{ok - 12 'A' =~ /�A/ib $^X $__FILE__\n};
}

if ('A' =~ /�a/) {
    print qq{not ok - 13 'A' =~ /�a/ $^X $__FILE__\n};
}
else {
    print qq{ok - 13 'A' =~ /�a/ $^X $__FILE__\n};
}

if ('A' =~ /�a/b) {
    print qq{not ok - 14 'A' =~ /�a/b $^X $__FILE__\n};
}
else {
    print qq{ok - 14 'A' =~ /�a/b $^X $__FILE__\n};
}

if ('A' =~ /�a/i) {
    print qq{not ok - 15 'A' =~ /�a/i $^X $__FILE__\n};
}
else {
    print qq{ok - 15 'A' =~ /�a/i $^X $__FILE__\n};
}

if ('A' =~ /�a/ib) {
    print qq{not ok - 16 'A' =~ /�a/ib $^X $__FILE__\n};
}
else {
    print qq{ok - 16 'A' =~ /�a/ib $^X $__FILE__\n};
}

if ('a' =~ /�A/) {
    print qq{not ok - 17 'a' =~ /�A/ $^X $__FILE__\n};
}
else {
    print qq{ok - 17 'a' =~ /�A/ $^X $__FILE__\n};
}

if ('a' =~ /�A/b) {
    print qq{not ok - 18 'a' =~ /�A/b $^X $__FILE__\n};
}
else {
    print qq{ok - 18 'a' =~ /�A/b $^X $__FILE__\n};
}

if ('a' =~ /�A/i) {
    print qq{not ok - 19 'a' =~ /�A/i $^X $__FILE__\n};
}
else {
    print qq{ok - 19 'a' =~ /�A/i $^X $__FILE__\n};
}

if ('a' =~ /�A/ib) {
    print qq{not ok - 20 'a' =~ /�A/ib $^X $__FILE__\n};
}
else {
    print qq{ok - 20 'a' =~ /�A/ib $^X $__FILE__\n};
}

if ('a' =~ /�a/) {
    print qq{not ok - 21 'a' =~ /�a/ $^X $__FILE__\n};
}
else {
    print qq{ok - 21 'a' =~ /�a/ $^X $__FILE__\n};
}

if ('a' =~ /�a/b) {
    print qq{not ok - 22 'a' =~ /�a/b $^X $__FILE__\n};
}
else {
    print qq{ok - 22 'a' =~ /�a/b $^X $__FILE__\n};
}

if ('a' =~ /�a/i) {
    print qq{not ok - 23 'a' =~ /�a/i $^X $__FILE__\n};
}
else {
    print qq{ok - 23 'a' =~ /�a/i $^X $__FILE__\n};
}

if ('a' =~ /�a/ib) {
    print qq{not ok - 24 'a' =~ /�a/ib $^X $__FILE__\n};
}
else {
    print qq{ok - 24 'a' =~ /�a/ib $^X $__FILE__\n};
}

if ('�A' =~ /A/) {
    print qq{not ok - 25 '�A' =~ /A/ $^X $__FILE__\n};
}
else {
    print qq{ok - 25 '�A' =~ /A/ $^X $__FILE__\n};
}

if ('�A' =~ /A/b) {
    print qq{ok - 26 '�A' =~ /A/b $^X $__FILE__\n};
}
else {
    print qq{not ok - 26 '�A' =~ /A/b $^X $__FILE__\n};
}

if ('�A' =~ /A/i) {
    print qq{not ok - 27 '�A' =~ /A/i $^X $__FILE__\n};
}
else {
    print qq{ok - 27 '�A' =~ /A/i $^X $__FILE__\n};
}

if ('�A' =~ /A/ib) {
    print qq{ok - 28 '�A' =~ /A/ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 28 '�A' =~ /A/ib $^X $__FILE__\n};
}

if ('�A' =~ /a/) {
    print qq{not ok - 29 '�A' =~ /a/ $^X $__FILE__\n};
}
else {
    print qq{ok - 29 '�A' =~ /a/ $^X $__FILE__\n};
}

if ('�A' =~ /a/b) {
    print qq{not ok - 30 '�A' =~ /a/b $^X $__FILE__\n};
}
else {
    print qq{ok - 30 '�A' =~ /a/b $^X $__FILE__\n};
}

if ('�A' =~ /a/i) {
    print qq{not ok - 31 '�A' =~ /a/i $^X $__FILE__\n};
}
else {
    print qq{ok - 31 '�A' =~ /a/i $^X $__FILE__\n};
}

if ('�A' =~ /a/ib) {
    print qq{ok - 32 '�A' =~ /a/ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 32 '�A' =~ /a/ib $^X $__FILE__\n};
}

if ('�a' =~ /A/) {
    print qq{not ok - 33 '�a' =~ /A/ $^X $__FILE__\n};
}
else {
    print qq{ok - 33 '�a' =~ /A/ $^X $__FILE__\n};
}

if ('�a' =~ /A/b) {
    print qq{not ok - 34 '�a' =~ /A/b $^X $__FILE__\n};
}
else {
    print qq{ok - 34 '�a' =~ /A/b $^X $__FILE__\n};
}

if ('�a' =~ /A/i) {
    print qq{not ok - 35 '�a' =~ /A/i $^X $__FILE__\n};
}
else {
    print qq{ok - 35 '�a' =~ /A/i $^X $__FILE__\n};
}

if ('�a' =~ /A/ib) {
    print qq{ok - 36 '�a' =~ /A/ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 36 '�a' =~ /A/ib $^X $__FILE__\n};
}

if ('�a' =~ /a/) {
    print qq{not ok - 37 '�a' =~ /a/ $^X $__FILE__\n};
}
else {
    print qq{ok - 37 '�a' =~ /a/ $^X $__FILE__\n};
}

if ('�a' =~ /a/b) {
    print qq{ok - 38 '�a' =~ /a/b $^X $__FILE__\n};
}
else {
    print qq{not ok - 38 '�a' =~ /a/b $^X $__FILE__\n};
}

if ('�a' =~ /a/i) {
    print qq{not ok - 39 '�a' =~ /a/i $^X $__FILE__\n};
}
else {
    print qq{ok - 39 '�a' =~ /a/i $^X $__FILE__\n};
}

if ('�a' =~ /a/ib) {
    print qq{ok - 40 '�a' =~ /a/ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 40 '�a' =~ /a/ib $^X $__FILE__\n};
}

if ('��A' =~ /�A/) {
    print qq{not ok - 41 '��A' =~ /�A/ $^X $__FILE__\n};
}
else {
    print qq{ok - 41 '��A' =~ /�A/ $^X $__FILE__\n};
}

if ('��A' =~ /�A/b) {
    print qq{ok - 42 '��A' =~ /�A/b $^X $__FILE__\n};
}
else {
    print qq{not ok - 42 '��A' =~ /�A/b $^X $__FILE__\n};
}

if ('��A' =~ /�A/i) {
    print qq{not ok - 43 '��A' =~ /�A/i $^X $__FILE__\n};
}
else {
    print qq{ok - 43 '��A' =~ /�A/i $^X $__FILE__\n};
}

if ('��A' =~ /�A/ib) {
    print qq{ok - 44 '��A' =~ /�A/ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 44 '��A' =~ /�A/ib $^X $__FILE__\n};
}

if ('��A' =~ /�a/) {
    print qq{not ok - 45 '��A' =~ /�a/ $^X $__FILE__\n};
}
else {
    print qq{ok - 45 '��A' =~ /�a/ $^X $__FILE__\n};
}

if ('��A' =~ /�a/b) {
    print qq{not ok - 46 '��A' =~ /�a/b $^X $__FILE__\n};
}
else {
    print qq{ok - 46 '��A' =~ /�a/b $^X $__FILE__\n};
}

if ('��A' =~ /�a/i) {
    print qq{not ok - 47 '��A' =~ /�a/i $^X $__FILE__\n};
}
else {
    print qq{ok - 47 '��A' =~ /�a/i $^X $__FILE__\n};
}

if ('��A' =~ /�a/ib) {
    print qq{ok - 48 '��A' =~ /�a/ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 48 '��A' =~ /�a/ib $^X $__FILE__\n};
}

if ('��a' =~ /�A/) {
    print qq{not ok - 49 '��a' =~ /�A/ $^X $__FILE__\n};
}
else {
    print qq{ok - 49 '��a' =~ /�A/ $^X $__FILE__\n};
}

if ('��a' =~ /�A/b) {
    print qq{not ok - 50 '��a' =~ /�A/b $^X $__FILE__\n};
}
else {
    print qq{ok - 50 '��a' =~ /�A/b $^X $__FILE__\n};
}

if ('��a' =~ /�A/i) {
    print qq{not ok - 51 '��a' =~ /�A/i $^X $__FILE__\n};
}
else {
    print qq{ok - 51 '��a' =~ /�A/i $^X $__FILE__\n};
}

if ('��a' =~ /�A/ib) {
    print qq{ok - 52 '��a' =~ /�A/ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 52 '��a' =~ /�A/ib $^X $__FILE__\n};
}

if ('��a' =~ /�a/) {
    print qq{not ok - 53 '��a' =~ /�a/ $^X $__FILE__\n};
}
else {
    print qq{ok - 53 '��a' =~ /�a/ $^X $__FILE__\n};
}

if ('��a' =~ /�a/b) {
    print qq{ok - 54 '��a' =~ /�a/b $^X $__FILE__\n};
}
else {
    print qq{not ok - 54 '��a' =~ /�a/b $^X $__FILE__\n};
}

if ('��a' =~ /�a/i) {
    print qq{not ok - 55 '��a' =~ /�a/i $^X $__FILE__\n};
}
else {
    print qq{ok - 55 '��a' =~ /�a/i $^X $__FILE__\n};
}

if ('��a' =~ /�a/ib) {
    print qq{ok - 56 '��a' =~ /�a/ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 56 '��a' =~ /�a/ib $^X $__FILE__\n};
}

__END__

