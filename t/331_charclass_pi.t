# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use Char::UHC;
print "1..20\n";

my $__FILE__ = __FILE__;

if ("A" =~ /[B-��]/i) {
    print qq{ok - 1 "A"=~/[B-��]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 "A"=~/[B-��]/i $^X $__FILE__\n};
}

if ("B" =~ /[B-��]/i) {
    print qq{ok - 2 "B"=~/[B-��]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 2 "B"=~/[B-��]/i $^X $__FILE__\n};
}

if ("��" =~ /[B-��]/i) {
    print qq{ok - 3 "��"=~/[B-��]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 3 "��"=~/[B-��]/i $^X $__FILE__\n};
}

if ("��" =~ /[B-��]/i) {
    print qq{ok - 4 "��"=~/[B-��]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 4 "��"=~/[B-��]/i $^X $__FILE__\n};
}

if ("��" !~ /[B-��]/i) {
    print qq{ok - 5 "��"!~/[B-��]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 5 "��"!~/[B-��]/i $^X $__FILE__\n};
}

my $from = 'B';
if ("A" =~ /[$from-��]/i) {
    print qq{ok - 6 "A"=~/[\$from-��]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 6 "A"=~/[\$from-��]/i $^X $__FILE__\n};
}

if ("B" =~ /[$from-��]/i) {
    print qq{ok - 7 "B"=~/[\$from-��]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 7 "B"=~/[\$from-��]/i $^X $__FILE__\n};
}

if ("��" =~ /[$from-��]/i) {
    print qq{ok - 8 "��"=~/[\$from-��]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 8 "��"=~/[\$from-��]/i $^X $__FILE__\n};
}

if ("��" =~ /[$from-��]/i) {
    print qq{ok - 9 "��"=~/[\$from-��]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 9 "��"=~/[\$from-��]/i $^X $__FILE__\n};
}

if ("��" !~ /[$from-��]/i) {
    print qq{ok - 10 "��"!~/[\$from-��]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 10 "��"!~/[\$from-��]/i $^X $__FILE__\n};
}

my $to = '��';
if ("A" =~ /[$from-$to]/i) {
    print qq{ok - 11 "A"=~/[\$from-\$to]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 11 "A"=~/[\$from-\$to]/i $^X $__FILE__\n};
}

if ("B" =~ /[$from-$to]/i) {
    print qq{ok - 12 "B"=~/[\$from-\$to]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 12 "B"=~/[\$from-\$to]/i $^X $__FILE__\n};
}

if ("��" =~ /[$from-$to]/i) {
    print qq{ok - 13 "��"=~/[\$from-\$to]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 13 "��"=~/[\$from-\$to]/i $^X $__FILE__\n};
}

if ("��" =~ /[$from-$to]/i) {
    print qq{ok - 14 "��"=~/[\$from-\$to]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 14 "��"=~/[\$from-\$to]/i $^X $__FILE__\n};
}

if ("��" !~ /[$from-$to]/i) {
    print qq{ok - 15 "��"!~/[\$from-\$to]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 15 "��"!~/[\$from-\$to]/i $^X $__FILE__\n};
}

if ("A" =~ /[${from}-${to}]/i) {
    print qq{ok - 16 "A"=~/[\${from}-\${to}]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 16 "A"=~/[\${from}-\${to}]/i $^X $__FILE__\n};
}

if ("B" =~ /[${from}-${to}]/i) {
    print qq{ok - 17 "B"=~/[\${from}-\${to}]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 17 "B"=~/[\${from}-\${to}]/i $^X $__FILE__\n};
}

if ("��" =~ /[${from}-${to}]/i) {
    print qq{ok - 18 "��"=~/[\${from}-\${to}]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 18 "��"=~/[\${from}-\${to}]/i $^X $__FILE__\n};
}

if ("��" =~ /[${from}-${to}]/i) {
    print qq{ok - 19 "��"=~/[\${from}-\${to}]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 19 "��"=~/[\${from}-\${to}]/i $^X $__FILE__\n};
}

if ("��" !~ /[${from}-${to}]/i) {
    print qq{ok - 20 "��"!~/[\${from}-\${to}]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 20 "��"!~/[\${from}-\${to}]/i $^X $__FILE__\n};
}

__END__
