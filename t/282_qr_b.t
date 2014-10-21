# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use strict;
use Char::UHC;
print "1..56\n";

my $__FILE__ = __FILE__;

if ('A' =~ qr'A') {
    print qq{ok - 1 'A' =~ qr'A' $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 'A' =~ qr'A' $^X $__FILE__\n};
}

if ('A' =~ qr'A'b) {
    print qq{ok - 2 'A' =~ qr'A'b $^X $__FILE__\n};
}
else {
    print qq{not ok - 2 'A' =~ qr'A'b $^X $__FILE__\n};
}

if ('A' =~ qr'a'i) {
    print qq{ok - 3 'A' =~ qr'a'i $^X $__FILE__\n};
}
else {
    print qq{not ok - 3 'A' =~ qr'a'i $^X $__FILE__\n};
}

if ('A' =~ qr'a'ib) {
    print qq{ok - 4 'A' =~ qr'a'ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 4 'A' =~ qr'a'ib $^X $__FILE__\n};
}

if ('a' =~ qr'A') {
    print qq{not ok - 5 'a' =~ qr'A' $^X $__FILE__\n};
}
else {
    print qq{ok - 5 'a' =~ qr'A' $^X $__FILE__\n};
}

if ('a' =~ qr'A'b) {
    print qq{not ok - 6 'a' =~ qr'A'b $^X $__FILE__\n};
}
else {
    print qq{ok - 6 'a' =~ qr'A'b $^X $__FILE__\n};
}

if ('a' =~ qr'a'i) {
    print qq{ok - 7 'a' =~ qr'a'i $^X $__FILE__\n};
}
else {
    print qq{not ok - 7 'a' =~ qr'a'i $^X $__FILE__\n};
}

if ('a' =~ qr'a'ib) {
    print qq{ok - 8 'a' =~ qr'a'ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 8 'a' =~ qr'a'ib $^X $__FILE__\n};
}

if ('A' =~ qr'�A') {
    print qq{not ok - 9 'A' =~ qr'�A' $^X $__FILE__\n};
}
else {
    print qq{ok - 9 'A' =~ qr'�A' $^X $__FILE__\n};
}

if ('A' =~ qr'�A'b) {
    print qq{not ok - 10 'A' =~ qr'�A'b $^X $__FILE__\n};
}
else {
    print qq{ok - 10 'A' =~ qr'�A'b $^X $__FILE__\n};
}

if ('A' =~ qr'�A'i) {
    print qq{not ok - 11 'A' =~ qr'�A'i $^X $__FILE__\n};
}
else {
    print qq{ok - 11 'A' =~ qr'�A'i $^X $__FILE__\n};
}

if ('A' =~ qr'�A'ib) {
    print qq{not ok - 12 'A' =~ qr'�A'ib $^X $__FILE__\n};
}
else {
    print qq{ok - 12 'A' =~ qr'�A'ib $^X $__FILE__\n};
}

if ('A' =~ qr'�a') {
    print qq{not ok - 13 'A' =~ qr'�a' $^X $__FILE__\n};
}
else {
    print qq{ok - 13 'A' =~ qr'�a' $^X $__FILE__\n};
}

if ('A' =~ qr'�a'b) {
    print qq{not ok - 14 'A' =~ qr'�a'b $^X $__FILE__\n};
}
else {
    print qq{ok - 14 'A' =~ qr'�a'b $^X $__FILE__\n};
}

if ('A' =~ qr'�a'i) {
    print qq{not ok - 15 'A' =~ qr'�a'i $^X $__FILE__\n};
}
else {
    print qq{ok - 15 'A' =~ qr'�a'i $^X $__FILE__\n};
}

if ('A' =~ qr'�a'ib) {
    print qq{not ok - 16 'A' =~ qr'�a'ib $^X $__FILE__\n};
}
else {
    print qq{ok - 16 'A' =~ qr'�a'ib $^X $__FILE__\n};
}

if ('a' =~ qr'�A') {
    print qq{not ok - 17 'a' =~ qr'�A' $^X $__FILE__\n};
}
else {
    print qq{ok - 17 'a' =~ qr'�A' $^X $__FILE__\n};
}

if ('a' =~ qr'�A'b) {
    print qq{not ok - 18 'a' =~ qr'�A'b $^X $__FILE__\n};
}
else {
    print qq{ok - 18 'a' =~ qr'�A'b $^X $__FILE__\n};
}

if ('a' =~ qr'�A'i) {
    print qq{not ok - 19 'a' =~ qr'�A'i $^X $__FILE__\n};
}
else {
    print qq{ok - 19 'a' =~ qr'�A'i $^X $__FILE__\n};
}

if ('a' =~ qr'�A'ib) {
    print qq{not ok - 20 'a' =~ qr'�A'ib $^X $__FILE__\n};
}
else {
    print qq{ok - 20 'a' =~ qr'�A'ib $^X $__FILE__\n};
}

if ('a' =~ qr'�a') {
    print qq{not ok - 21 'a' =~ qr'�a' $^X $__FILE__\n};
}
else {
    print qq{ok - 21 'a' =~ qr'�a' $^X $__FILE__\n};
}

if ('a' =~ qr'�a'b) {
    print qq{not ok - 22 'a' =~ qr'�a'b $^X $__FILE__\n};
}
else {
    print qq{ok - 22 'a' =~ qr'�a'b $^X $__FILE__\n};
}

if ('a' =~ qr'�a'i) {
    print qq{not ok - 23 'a' =~ qr'�a'i $^X $__FILE__\n};
}
else {
    print qq{ok - 23 'a' =~ qr'�a'i $^X $__FILE__\n};
}

if ('a' =~ qr'�a'ib) {
    print qq{not ok - 24 'a' =~ qr'�a'ib $^X $__FILE__\n};
}
else {
    print qq{ok - 24 'a' =~ qr'�a'ib $^X $__FILE__\n};
}

if ('�A' =~ qr'A') {
    print qq{not ok - 25 '�A' =~ qr'A' $^X $__FILE__\n};
}
else {
    print qq{ok - 25 '�A' =~ qr'A' $^X $__FILE__\n};
}

if ('�A' =~ qr'A'b) {
    print qq{ok - 26 '�A' =~ qr'A'b $^X $__FILE__\n};
}
else {
    print qq{not ok - 26 '�A' =~ qr'A'b $^X $__FILE__\n};
}

if ('�A' =~ qr'A'i) {
    print qq{not ok - 27 '�A' =~ qr'A'i $^X $__FILE__\n};
}
else {
    print qq{ok - 27 '�A' =~ qr'A'i $^X $__FILE__\n};
}

if ('�A' =~ qr'A'ib) {
    print qq{ok - 28 '�A' =~ qr'A'ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 28 '�A' =~ qr'A'ib $^X $__FILE__\n};
}

if ('�A' =~ qr'a') {
    print qq{not ok - 29 '�A' =~ qr'a' $^X $__FILE__\n};
}
else {
    print qq{ok - 29 '�A' =~ qr'a' $^X $__FILE__\n};
}

if ('�A' =~ qr'a'b) {
    print qq{not ok - 30 '�A' =~ qr'a'b $^X $__FILE__\n};
}
else {
    print qq{ok - 30 '�A' =~ qr'a'b $^X $__FILE__\n};
}

if ('�A' =~ qr'a'i) {
    print qq{not ok - 31 '�A' =~ qr'a'i $^X $__FILE__\n};
}
else {
    print qq{ok - 31 '�A' =~ qr'a'i $^X $__FILE__\n};
}

if ('�A' =~ qr'a'ib) {
    print qq{ok - 32 '�A' =~ qr'a'ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 32 '�A' =~ qr'a'ib $^X $__FILE__\n};
}

if ('�a' =~ qr'A') {
    print qq{not ok - 33 '�a' =~ qr'A' $^X $__FILE__\n};
}
else {
    print qq{ok - 33 '�a' =~ qr'A' $^X $__FILE__\n};
}

if ('�a' =~ qr'A'b) {
    print qq{not ok - 34 '�a' =~ qr'A'b $^X $__FILE__\n};
}
else {
    print qq{ok - 34 '�a' =~ qr'A'b $^X $__FILE__\n};
}

if ('�a' =~ qr'A'i) {
    print qq{not ok - 35 '�a' =~ qr'A'i $^X $__FILE__\n};
}
else {
    print qq{ok - 35 '�a' =~ qr'A'i $^X $__FILE__\n};
}

if ('�a' =~ qr'A'ib) {
    print qq{ok - 36 '�a' =~ qr'A'ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 36 '�a' =~ qr'A'ib $^X $__FILE__\n};
}

if ('�a' =~ qr'a') {
    print qq{not ok - 37 '�a' =~ qr'a' $^X $__FILE__\n};
}
else {
    print qq{ok - 37 '�a' =~ qr'a' $^X $__FILE__\n};
}

if ('�a' =~ qr'a'b) {
    print qq{ok - 38 '�a' =~ qr'a'b $^X $__FILE__\n};
}
else {
    print qq{not ok - 38 '�a' =~ qr'a'b $^X $__FILE__\n};
}

if ('�a' =~ qr'a'i) {
    print qq{not ok - 39 '�a' =~ qr'a'i $^X $__FILE__\n};
}
else {
    print qq{ok - 39 '�a' =~ qr'a'i $^X $__FILE__\n};
}

if ('�a' =~ qr'a'ib) {
    print qq{ok - 40 '�a' =~ qr'a'ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 40 '�a' =~ qr'a'ib $^X $__FILE__\n};
}

if ('��A' =~ qr'�A') {
    print qq{not ok - 41 '��A' =~ qr'�A' $^X $__FILE__\n};
}
else {
    print qq{ok - 41 '��A' =~ qr'�A' $^X $__FILE__\n};
}

if ('��A' =~ qr'�A'b) {
    print qq{ok - 42 '��A' =~ qr'�A'b $^X $__FILE__\n};
}
else {
    print qq{not ok - 42 '��A' =~ qr'�A'b $^X $__FILE__\n};
}

if ('��A' =~ qr'�A'i) {
    print qq{not ok - 43 '��A' =~ qr'�A'i $^X $__FILE__\n};
}
else {
    print qq{ok - 43 '��A' =~ qr'�A'i $^X $__FILE__\n};
}

if ('��A' =~ qr'�A'ib) {
    print qq{ok - 44 '��A' =~ qr'�A'ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 44 '��A' =~ qr'�A'ib $^X $__FILE__\n};
}

if ('��A' =~ qr'�a') {
    print qq{not ok - 45 '��A' =~ qr'�a' $^X $__FILE__\n};
}
else {
    print qq{ok - 45 '��A' =~ qr'�a' $^X $__FILE__\n};
}

if ('��A' =~ qr'�a'b) {
    print qq{not ok - 46 '��A' =~ qr'�a'b $^X $__FILE__\n};
}
else {
    print qq{ok - 46 '��A' =~ qr'�a'b $^X $__FILE__\n};
}

if ('��A' =~ qr'�a'i) {
    print qq{not ok - 47 '��A' =~ qr'�a'i $^X $__FILE__\n};
}
else {
    print qq{ok - 47 '��A' =~ qr'�a'i $^X $__FILE__\n};
}

if ('��A' =~ qr'�a'ib) {
    print qq{ok - 48 '��A' =~ qr'�a'ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 48 '��A' =~ qr'�a'ib $^X $__FILE__\n};
}

if ('��a' =~ qr'�A') {
    print qq{not ok - 49 '��a' =~ qr'�A' $^X $__FILE__\n};
}
else {
    print qq{ok - 49 '��a' =~ qr'�A' $^X $__FILE__\n};
}

if ('��a' =~ qr'�A'b) {
    print qq{not ok - 50 '��a' =~ qr'�A'b $^X $__FILE__\n};
}
else {
    print qq{ok - 50 '��a' =~ qr'�A'b $^X $__FILE__\n};
}

if ('��a' =~ qr'�A'i) {
    print qq{not ok - 51 '��a' =~ qr'�A'i $^X $__FILE__\n};
}
else {
    print qq{ok - 51 '��a' =~ qr'�A'i $^X $__FILE__\n};
}

if ('��a' =~ qr'�A'ib) {
    print qq{ok - 52 '��a' =~ qr'�A'ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 52 '��a' =~ qr'�A'ib $^X $__FILE__\n};
}

if ('��a' =~ qr'�a') {
    print qq{not ok - 53 '��a' =~ qr'�a' $^X $__FILE__\n};
}
else {
    print qq{ok - 53 '��a' =~ qr'�a' $^X $__FILE__\n};
}

if ('��a' =~ qr'�a'b) {
    print qq{ok - 54 '��a' =~ qr'�a'b $^X $__FILE__\n};
}
else {
    print qq{not ok - 54 '��a' =~ qr'�a'b $^X $__FILE__\n};
}

if ('��a' =~ qr'�a'i) {
    print qq{not ok - 55 '��a' =~ qr'�a'i $^X $__FILE__\n};
}
else {
    print qq{ok - 55 '��a' =~ qr'�a'i $^X $__FILE__\n};
}

if ('��a' =~ qr'�a'ib) {
    print qq{ok - 56 '��a' =~ qr'�a'ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 56 '��a' =~ qr'�a'ib $^X $__FILE__\n};
}

__END__

