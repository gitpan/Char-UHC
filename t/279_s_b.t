# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use strict;
use Char::UHC;
print "1..56\n";

my $__FILE__ = __FILE__;

$_ = 'A';
if ($_ =~ s/A//) {
    print qq{ok - 1 \$_ =~ s/A// $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 \$_ =~ s/A// $^X $__FILE__\n};
}

$_ = 'A';
if ($_ =~ s/A//b) {
    print qq{ok - 2 \$_ =~ s/A//b $^X $__FILE__\n};
}
else {
    print qq{not ok - 2 \$_ =~ s/A//b $^X $__FILE__\n};
}

$_ = 'A';
if ($_ =~ s/a//i) {
    print qq{ok - 3 \$_ =~ s/a//i $^X $__FILE__\n};
}
else {
    print qq{not ok - 3 \$_ =~ s/a//i $^X $__FILE__\n};
}

$_ = 'A';
if ($_ =~ s/a//ib) {
    print qq{ok - 4 \$_ =~ s/a//ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 4 \$_ =~ s/a//ib $^X $__FILE__\n};
}

$_ = 'a';
if ($_ =~ s/A//) {
    print qq{not ok - 5 \$_ =~ s/A// $^X $__FILE__\n};
}
else {
    print qq{ok - 5 \$_ =~ s/A// $^X $__FILE__\n};
}

$_ = 'a';
if ($_ =~ s/A//b) {
    print qq{not ok - 6 \$_ =~ s/A//b $^X $__FILE__\n};
}
else {
    print qq{ok - 6 \$_ =~ s/A//b $^X $__FILE__\n};
}

$_ = 'a';
if ($_ =~ s/a//i) {
    print qq{ok - 7 \$_ =~ s/a//i $^X $__FILE__\n};
}
else {
    print qq{not ok - 7 \$_ =~ s/a//i $^X $__FILE__\n};
}

$_ = 'a';
if ($_ =~ s/a//ib) {
    print qq{ok - 8 \$_ =~ s/a//ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 8 \$_ =~ s/a//ib $^X $__FILE__\n};
}

$_ = 'A';
if ($_ =~ s/�A//) {
    print qq{not ok - 9 \$_ =~ s/�A// $^X $__FILE__\n};
}
else {
    print qq{ok - 9 \$_ =~ s/�A// $^X $__FILE__\n};
}

$_ = 'A';
if ($_ =~ s/�A//b) {
    print qq{not ok - 10 \$_ =~ s/�A//b $^X $__FILE__\n};
}
else {
    print qq{ok - 10 \$_ =~ s/�A//b $^X $__FILE__\n};
}

$_ = 'A';
if ($_ =~ s/�A//i) {
    print qq{not ok - 11 \$_ =~ s/�A//i $^X $__FILE__\n};
}
else {
    print qq{ok - 11 \$_ =~ s/�A//i $^X $__FILE__\n};
}

$_ = 'A';
if ($_ =~ s/�A//ib) {
    print qq{not ok - 12 \$_ =~ s/�A//ib $^X $__FILE__\n};
}
else {
    print qq{ok - 12 \$_ =~ s/�A//ib $^X $__FILE__\n};
}

$_ = 'A';
if ($_ =~ s/�a//) {
    print qq{not ok - 13 \$_ =~ s/�a// $^X $__FILE__\n};
}
else {
    print qq{ok - 13 \$_ =~ s/�a// $^X $__FILE__\n};
}

$_ = 'A';
if ($_ =~ s/�a//b) {
    print qq{not ok - 14 \$_ =~ s/�a//b $^X $__FILE__\n};
}
else {
    print qq{ok - 14 \$_ =~ s/�a//b $^X $__FILE__\n};
}

$_ = 'A';
if ($_ =~ s/�a//i) {
    print qq{not ok - 15 \$_ =~ s/�a//i $^X $__FILE__\n};
}
else {
    print qq{ok - 15 \$_ =~ s/�a//i $^X $__FILE__\n};
}

$_ = 'A';
if ($_ =~ s/�a//ib) {
    print qq{not ok - 16 \$_ =~ s/�a//ib $^X $__FILE__\n};
}
else {
    print qq{ok - 16 \$_ =~ s/�a//ib $^X $__FILE__\n};
}

$_ = 'a';
if ($_ =~ s/�A//) {
    print qq{not ok - 17 \$_ =~ s/�A// $^X $__FILE__\n};
}
else {
    print qq{ok - 17 \$_ =~ s/�A// $^X $__FILE__\n};
}

$_ = 'a';
if ($_ =~ s/�A//b) {
    print qq{not ok - 18 \$_ =~ s/�A//b $^X $__FILE__\n};
}
else {
    print qq{ok - 18 \$_ =~ s/�A//b $^X $__FILE__\n};
}

$_ = 'a';
if ($_ =~ s/�A//i) {
    print qq{not ok - 19 \$_ =~ s/�A//i $^X $__FILE__\n};
}
else {
    print qq{ok - 19 \$_ =~ s/�A//i $^X $__FILE__\n};
}

$_ = 'a';
if ($_ =~ s/�A//ib) {
    print qq{not ok - 20 \$_ =~ s/�A//ib $^X $__FILE__\n};
}
else {
    print qq{ok - 20 \$_ =~ s/�A//ib $^X $__FILE__\n};
}

$_ = 'a';
if ($_ =~ s/�a//) {
    print qq{not ok - 21 \$_ =~ s/�a// $^X $__FILE__\n};
}
else {
    print qq{ok - 21 \$_ =~ s/�a// $^X $__FILE__\n};
}

$_ = 'a';
if ($_ =~ s/�a//b) {
    print qq{not ok - 22 \$_ =~ s/�a//b $^X $__FILE__\n};
}
else {
    print qq{ok - 22 \$_ =~ s/�a//b $^X $__FILE__\n};
}

$_ = 'a';
if ($_ =~ s/�a//i) {
    print qq{not ok - 23 \$_ =~ s/�a//i $^X $__FILE__\n};
}
else {
    print qq{ok - 23 \$_ =~ s/�a//i $^X $__FILE__\n};
}

$_ = 'a';
if ($_ =~ s/�a//ib) {
    print qq{not ok - 24 \$_ =~ s/�a//ib $^X $__FILE__\n};
}
else {
    print qq{ok - 24 \$_ =~ s/�a//ib $^X $__FILE__\n};
}

$_ = '�A';
if ($_ =~ s/A//) {
    print qq{not ok - 25 \$_ =~ s/A// $^X $__FILE__\n};
}
else {
    print qq{ok - 25 \$_ =~ s/A// $^X $__FILE__\n};
}

$_ = '�A';
if ($_ =~ s/A//b) {
    print qq{ok - 26 \$_ =~ s/A//b $^X $__FILE__\n};
}
else {
    print qq{not ok - 26 \$_ =~ s/A//b $^X $__FILE__\n};
}

$_ = '�A';
if ($_ =~ s/A//i) {
    print qq{not ok - 27 \$_ =~ s/A//i $^X $__FILE__\n};
}
else {
    print qq{ok - 27 \$_ =~ s/A//i $^X $__FILE__\n};
}

$_ = '�A';
if ($_ =~ s/A//ib) {
    print qq{ok - 28 \$_ =~ s/A//ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 28 \$_ =~ s/A//ib $^X $__FILE__\n};
}

$_ = '�A';
if ($_ =~ s/a//) {
    print qq{not ok - 29 \$_ =~ s/a// $^X $__FILE__\n};
}
else {
    print qq{ok - 29 \$_ =~ s/a// $^X $__FILE__\n};
}

$_ = '�A';
if ($_ =~ s/a//b) {
    print qq{not ok - 30 \$_ =~ s/a//b $^X $__FILE__\n};
}
else {
    print qq{ok - 30 \$_ =~ s/a//b $^X $__FILE__\n};
}

$_ = '�A';
if ($_ =~ s/a//i) {
    print qq{not ok - 31 \$_ =~ s/a//i $^X $__FILE__\n};
}
else {
    print qq{ok - 31 \$_ =~ s/a//i $^X $__FILE__\n};
}

$_ = '�A';
if ($_ =~ s/a//ib) {
    print qq{ok - 32 \$_ =~ s/a//ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 32 \$_ =~ s/a//ib $^X $__FILE__\n};
}

$_ = '�a';
if ($_ =~ s/A//) {
    print qq{not ok - 33 \$_ =~ s/A// $^X $__FILE__\n};
}
else {
    print qq{ok - 33 \$_ =~ s/A// $^X $__FILE__\n};
}

$_ = '�a';
if ($_ =~ s/A//b) {
    print qq{not ok - 34 \$_ =~ s/A//b $^X $__FILE__\n};
}
else {
    print qq{ok - 34 \$_ =~ s/A//b $^X $__FILE__\n};
}

$_ = '�a';
if ($_ =~ s/A//i) {
    print qq{not ok - 35 \$_ =~ s/A//i $^X $__FILE__\n};
}
else {
    print qq{ok - 35 \$_ =~ s/A//i $^X $__FILE__\n};
}

$_ = '�a';
if ($_ =~ s/A//ib) {
    print qq{ok - 36 \$_ =~ s/A//ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 36 \$_ =~ s/A//ib $^X $__FILE__\n};
}

$_ = '�a';
if ($_ =~ s/a//) {
    print qq{not ok - 37 \$_ =~ s/a// $^X $__FILE__\n};
}
else {
    print qq{ok - 37 \$_ =~ s/a// $^X $__FILE__\n};
}

$_ = '�a';
if ($_ =~ s/a//b) {
    print qq{ok - 38 \$_ =~ s/a//b $^X $__FILE__\n};
}
else {
    print qq{not ok - 38 \$_ =~ s/a//b $^X $__FILE__\n};
}

$_ = '�a';
if ($_ =~ s/a//i) {
    print qq{not ok - 39 \$_ =~ s/a//i $^X $__FILE__\n};
}
else {
    print qq{ok - 39 \$_ =~ s/a//i $^X $__FILE__\n};
}

$_ = '�a';
if ($_ =~ s/a//ib) {
    print qq{ok - 40 \$_ =~ s/a//ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 40 \$_ =~ s/a//ib $^X $__FILE__\n};
}

$_ = '��A';
if ($_ =~ s/�A//) {
    print qq{not ok - 41 \$_ =~ s/�A// $^X $__FILE__\n};
}
else {
    print qq{ok - 41 \$_ =~ s/�A// $^X $__FILE__\n};
}

$_ = '��A';
if ($_ =~ s/�A//b) {
    print qq{ok - 42 \$_ =~ s/�A//b $^X $__FILE__\n};
}
else {
    print qq{not ok - 42 \$_ =~ s/�A//b $^X $__FILE__\n};
}

$_ = '��A';
if ($_ =~ s/�A//i) {
    print qq{not ok - 43 \$_ =~ s/�A//i $^X $__FILE__\n};
}
else {
    print qq{ok - 43 \$_ =~ s/�A//i $^X $__FILE__\n};
}

$_ = '��A';
if ($_ =~ s/�A//ib) {
    print qq{ok - 44 \$_ =~ s/�A//ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 44 \$_ =~ s/�A//ib $^X $__FILE__\n};
}

$_ = '��A';
if ($_ =~ s/�a//) {
    print qq{not ok - 45 \$_ =~ s/�a// $^X $__FILE__\n};
}
else {
    print qq{ok - 45 \$_ =~ s/�a// $^X $__FILE__\n};
}

$_ = '��A';
if ($_ =~ s/�a//b) {
    print qq{not ok - 46 \$_ =~ s/�a//b $^X $__FILE__\n};
}
else {
    print qq{ok - 46 \$_ =~ s/�a//b $^X $__FILE__\n};
}

$_ = '��A';
if ($_ =~ s/�a//i) {
    print qq{not ok - 47 \$_ =~ s/�a//i $^X $__FILE__\n};
}
else {
    print qq{ok - 47 \$_ =~ s/�a//i $^X $__FILE__\n};
}

$_ = '��A';
if ($_ =~ s/�a//ib) {
    print qq{ok - 48 \$_ =~ s/�a//ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 48 \$_ =~ s/�a//ib $^X $__FILE__\n};
}

$_ = '��a';
if ($_ =~ s/�A//) {
    print qq{not ok - 49 \$_ =~ s/�A// $^X $__FILE__\n};
}
else {
    print qq{ok - 49 \$_ =~ s/�A// $^X $__FILE__\n};
}

$_ = '��a';
if ($_ =~ s/�A//b) {
    print qq{not ok - 50 \$_ =~ s/�A//b $^X $__FILE__\n};
}
else {
    print qq{ok - 50 \$_ =~ s/�A//b $^X $__FILE__\n};
}

$_ = '��a';
if ($_ =~ s/�A//i) {
    print qq{not ok - 51 \$_ =~ s/�A//i $^X $__FILE__\n};
}
else {
    print qq{ok - 51 \$_ =~ s/�A//i $^X $__FILE__\n};
}

$_ = '��a';
if ($_ =~ s/�A//ib) {
    print qq{ok - 52 \$_ =~ s/�A//ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 52 \$_ =~ s/�A//ib $^X $__FILE__\n};
}

$_ = '��a';
if ($_ =~ s/�a//) {
    print qq{not ok - 53 \$_ =~ s/�a// $^X $__FILE__\n};
}
else {
    print qq{ok - 53 \$_ =~ s/�a// $^X $__FILE__\n};
}

$_ = '��a';
if ($_ =~ s/�a//b) {
    print qq{ok - 54 \$_ =~ s/�a//b $^X $__FILE__\n};
}
else {
    print qq{not ok - 54 \$_ =~ s/�a//b $^X $__FILE__\n};
}

$_ = '��a';
if ($_ =~ s/�a//i) {
    print qq{not ok - 55 \$_ =~ s/�a//i $^X $__FILE__\n};
}
else {
    print qq{ok - 55 \$_ =~ s/�a//i $^X $__FILE__\n};
}

$_ = '��a';
if ($_ =~ s/�a//ib) {
    print qq{ok - 56 \$_ =~ s/�a//ib $^X $__FILE__\n};
}
else {
    print qq{not ok - 56 \$_ =~ s/�a//ib $^X $__FILE__\n};
}

__END__

