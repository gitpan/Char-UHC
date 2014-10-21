# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use strict;
use Char::UHC;
print "1..56\n";

my $__FILE__ = __FILE__;

if ('A' =~ m'A') {
    print qq{ok - 1 'A' =~ m'A' $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 'A' =~ m'A' $^X $__FILE__\n};
}

if ('A' =~ m'A'b) {
    print qq{ok - 2 'A' =~ m'A'b $^X $__FILE__\n};
}
else {
    print qq{not ok - 2 'A' =~ m'A'b $^X $__FILE__\n};
}

if ('A' =~ m'a'i) {
    print qq{ok - 3 'A' =~ m'a'i $^X $__FILE__\n};
}
else {
    print qq{not ok - 3 'A' =~ m'a'i $^X $__FILE__\n};
}

if ('A' =~ m'a'ib) {
    print qq{ok - 4 'A' =~ m'a'ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 4 'A' =~ m'a'ib $^X $__FILE__\n};
}

if ('a' =~ m'A') {
    print qq{not ok - 5 'a' =~ m'A' $^X $__FILE__\n};
}
else {
    print qq{ok - 5 'a' =~ m'A' $^X $__FILE__\n};
}

if ('a' =~ m'A'b) {
    print qq{not ok - 6 'a' =~ m'A'b $^X $__FILE__\n};
}
else {
    print qq{ok - 6 'a' =~ m'A'b $^X $__FILE__\n};
}

if ('a' =~ m'a'i) {
    print qq{ok - 7 'a' =~ m'a'i $^X $__FILE__\n};
}
else {
    print qq{not ok - 7 'a' =~ m'a'i $^X $__FILE__\n};
}

if ('a' =~ m'a'ib) {
    print qq{ok - 8 'a' =~ m'a'ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 8 'a' =~ m'a'ib $^X $__FILE__\n};
}

if ('A' =~ m'�A') {
    print qq{not ok - 9 'A' =~ m'�A' $^X $__FILE__\n};
}
else {
    print qq{ok - 9 'A' =~ m'�A' $^X $__FILE__\n};
}

if ('A' =~ m'�A'b) {
    print qq{not ok - 10 'A' =~ m'�A'b $^X $__FILE__\n};
}
else {
    print qq{ok - 10 'A' =~ m'�A'b $^X $__FILE__\n};
}

if ('A' =~ m'�A'i) {
    print qq{not ok - 11 'A' =~ m'�A'i $^X $__FILE__\n};
}
else {
    print qq{ok - 11 'A' =~ m'�A'i $^X $__FILE__\n};
}

if ('A' =~ m'�A'ib) {
    print qq{not ok - 12 'A' =~ m'�A'ib $^X $__FILE__\n};
}
else {
    print qq{ok - 12 'A' =~ m'�A'ib $^X $__FILE__\n};
}

if ('A' =~ m'�a') {
    print qq{not ok - 13 'A' =~ m'�a' $^X $__FILE__\n};
}
else {
    print qq{ok - 13 'A' =~ m'�a' $^X $__FILE__\n};
}

if ('A' =~ m'�a'b) {
    print qq{not ok - 14 'A' =~ m'�a'b $^X $__FILE__\n};
}
else {
    print qq{ok - 14 'A' =~ m'�a'b $^X $__FILE__\n};
}

if ('A' =~ m'�a'i) {
    print qq{not ok - 15 'A' =~ m'�a'i $^X $__FILE__\n};
}
else {
    print qq{ok - 15 'A' =~ m'�a'i $^X $__FILE__\n};
}

if ('A' =~ m'�a'ib) {
    print qq{not ok - 16 'A' =~ m'�a'ib $^X $__FILE__\n};
}
else {
    print qq{ok - 16 'A' =~ m'�a'ib $^X $__FILE__\n};
}

if ('a' =~ m'�A') {
    print qq{not ok - 17 'a' =~ m'�A' $^X $__FILE__\n};
}
else {
    print qq{ok - 17 'a' =~ m'�A' $^X $__FILE__\n};
}

if ('a' =~ m'�A'b) {
    print qq{not ok - 18 'a' =~ m'�A'b $^X $__FILE__\n};
}
else {
    print qq{ok - 18 'a' =~ m'�A'b $^X $__FILE__\n};
}

if ('a' =~ m'�A'i) {
    print qq{not ok - 19 'a' =~ m'�A'i $^X $__FILE__\n};
}
else {
    print qq{ok - 19 'a' =~ m'�A'i $^X $__FILE__\n};
}

if ('a' =~ m'�A'ib) {
    print qq{not ok - 20 'a' =~ m'�A'ib $^X $__FILE__\n};
}
else {
    print qq{ok - 20 'a' =~ m'�A'ib $^X $__FILE__\n};
}

if ('a' =~ m'�a') {
    print qq{not ok - 21 'a' =~ m'�a' $^X $__FILE__\n};
}
else {
    print qq{ok - 21 'a' =~ m'�a' $^X $__FILE__\n};
}

if ('a' =~ m'�a'b) {
    print qq{not ok - 22 'a' =~ m'�a'b $^X $__FILE__\n};
}
else {
    print qq{ok - 22 'a' =~ m'�a'b $^X $__FILE__\n};
}

if ('a' =~ m'�a'i) {
    print qq{not ok - 23 'a' =~ m'�a'i $^X $__FILE__\n};
}
else {
    print qq{ok - 23 'a' =~ m'�a'i $^X $__FILE__\n};
}

if ('a' =~ m'�a'ib) {
    print qq{not ok - 24 'a' =~ m'�a'ib $^X $__FILE__\n};
}
else {
    print qq{ok - 24 'a' =~ m'�a'ib $^X $__FILE__\n};
}

if ('�A' =~ m'A') {
    print qq{not ok - 25 '�A' =~ m'A' $^X $__FILE__\n};
}
else {
    print qq{ok - 25 '�A' =~ m'A' $^X $__FILE__\n};
}

if ('�A' =~ m'A'b) {
    print qq{ok - 26 '�A' =~ m'A'b $^X $__FILE__\n};
}
else {
    print qq{not ok - 26 '�A' =~ m'A'b $^X $__FILE__\n};
}

if ('�A' =~ m'A'i) {
    print qq{not ok - 27 '�A' =~ m'A'i $^X $__FILE__\n};
}
else {
    print qq{ok - 27 '�A' =~ m'A'i $^X $__FILE__\n};
}

if ('�A' =~ m'A'ib) {
    print qq{ok - 28 '�A' =~ m'A'ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 28 '�A' =~ m'A'ib $^X $__FILE__\n};
}

if ('�A' =~ m'a') {
    print qq{not ok - 29 '�A' =~ m'a' $^X $__FILE__\n};
}
else {
    print qq{ok - 29 '�A' =~ m'a' $^X $__FILE__\n};
}

if ('�A' =~ m'a'b) {
    print qq{not ok - 30 '�A' =~ m'a'b $^X $__FILE__\n};
}
else {
    print qq{ok - 30 '�A' =~ m'a'b $^X $__FILE__\n};
}

if ('�A' =~ m'a'i) {
    print qq{not ok - 31 '�A' =~ m'a'i $^X $__FILE__\n};
}
else {
    print qq{ok - 31 '�A' =~ m'a'i $^X $__FILE__\n};
}

if ('�A' =~ m'a'ib) {
    print qq{ok - 32 '�A' =~ m'a'ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 32 '�A' =~ m'a'ib $^X $__FILE__\n};
}

if ('�a' =~ m'A') {
    print qq{not ok - 33 '�a' =~ m'A' $^X $__FILE__\n};
}
else {
    print qq{ok - 33 '�a' =~ m'A' $^X $__FILE__\n};
}

if ('�a' =~ m'A'b) {
    print qq{not ok - 34 '�a' =~ m'A'b $^X $__FILE__\n};
}
else {
    print qq{ok - 34 '�a' =~ m'A'b $^X $__FILE__\n};
}

if ('�a' =~ m'A'i) {
    print qq{not ok - 35 '�a' =~ m'A'i $^X $__FILE__\n};
}
else {
    print qq{ok - 35 '�a' =~ m'A'i $^X $__FILE__\n};
}

if ('�a' =~ m'A'ib) {
    print qq{ok - 36 '�a' =~ m'A'ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 36 '�a' =~ m'A'ib $^X $__FILE__\n};
}

if ('�a' =~ m'a') {
    print qq{not ok - 37 '�a' =~ m'a' $^X $__FILE__\n};
}
else {
    print qq{ok - 37 '�a' =~ m'a' $^X $__FILE__\n};
}

if ('�a' =~ m'a'b) {
    print qq{ok - 38 '�a' =~ m'a'b $^X $__FILE__\n};
}
else {
    print qq{not ok - 38 '�a' =~ m'a'b $^X $__FILE__\n};
}

if ('�a' =~ m'a'i) {
    print qq{not ok - 39 '�a' =~ m'a'i $^X $__FILE__\n};
}
else {
    print qq{ok - 39 '�a' =~ m'a'i $^X $__FILE__\n};
}

if ('�a' =~ m'a'ib) {
    print qq{ok - 40 '�a' =~ m'a'ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 40 '�a' =~ m'a'ib $^X $__FILE__\n};
}

if ('��A' =~ m'�A') {
    print qq{not ok - 41 '��A' =~ m'�A' $^X $__FILE__\n};
}
else {
    print qq{ok - 41 '��A' =~ m'�A' $^X $__FILE__\n};
}

if ('��A' =~ m'�A'b) {
    print qq{ok - 42 '��A' =~ m'�A'b $^X $__FILE__\n};
}
else {
    print qq{not ok - 42 '��A' =~ m'�A'b $^X $__FILE__\n};
}

if ('��A' =~ m'�A'i) {
    print qq{not ok - 43 '��A' =~ m'�A'i $^X $__FILE__\n};
}
else {
    print qq{ok - 43 '��A' =~ m'�A'i $^X $__FILE__\n};
}

if ('��A' =~ m'�A'ib) {
    print qq{ok - 44 '��A' =~ m'�A'ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 44 '��A' =~ m'�A'ib $^X $__FILE__\n};
}

if ('��A' =~ m'�a') {
    print qq{not ok - 45 '��A' =~ m'�a' $^X $__FILE__\n};
}
else {
    print qq{ok - 45 '��A' =~ m'�a' $^X $__FILE__\n};
}

if ('��A' =~ m'�a'b) {
    print qq{not ok - 46 '��A' =~ m'�a'b $^X $__FILE__\n};
}
else {
    print qq{ok - 46 '��A' =~ m'�a'b $^X $__FILE__\n};
}

if ('��A' =~ m'�a'i) {
    print qq{not ok - 47 '��A' =~ m'�a'i $^X $__FILE__\n};
}
else {
    print qq{ok - 47 '��A' =~ m'�a'i $^X $__FILE__\n};
}

if ('��A' =~ m'�a'ib) {
    print qq{ok - 48 '��A' =~ m'�a'ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 48 '��A' =~ m'�a'ib $^X $__FILE__\n};
}

if ('��a' =~ m'�A') {
    print qq{not ok - 49 '��a' =~ m'�A' $^X $__FILE__\n};
}
else {
    print qq{ok - 49 '��a' =~ m'�A' $^X $__FILE__\n};
}

if ('��a' =~ m'�A'b) {
    print qq{not ok - 50 '��a' =~ m'�A'b $^X $__FILE__\n};
}
else {
    print qq{ok - 50 '��a' =~ m'�A'b $^X $__FILE__\n};
}

if ('��a' =~ m'�A'i) {
    print qq{not ok - 51 '��a' =~ m'�A'i $^X $__FILE__\n};
}
else {
    print qq{ok - 51 '��a' =~ m'�A'i $^X $__FILE__\n};
}

if ('��a' =~ m'�A'ib) {
    print qq{ok - 52 '��a' =~ m'�A'ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 52 '��a' =~ m'�A'ib $^X $__FILE__\n};
}

if ('��a' =~ m'�a') {
    print qq{not ok - 53 '��a' =~ m'�a' $^X $__FILE__\n};
}
else {
    print qq{ok - 53 '��a' =~ m'�a' $^X $__FILE__\n};
}

if ('��a' =~ m'�a'b) {
    print qq{ok - 54 '��a' =~ m'�a'b $^X $__FILE__\n};
}
else {
    print qq{not ok - 54 '��a' =~ m'�a'b $^X $__FILE__\n};
}

if ('��a' =~ m'�a'i) {
    print qq{not ok - 55 '��a' =~ m'�a'i $^X $__FILE__\n};
}
else {
    print qq{ok - 55 '��a' =~ m'�a'i $^X $__FILE__\n};
}

if ('��a' =~ m'�a'ib) {
    print qq{ok - 56 '��a' =~ m'�a'ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 56 '��a' =~ m'�a'ib $^X $__FILE__\n};
}

__END__

