# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use Char::UHC;
print "1..20\n";

my $__FILE__ = __FILE__;

if ("��" !~ /[��-��]/i) {
    print qq{ok - 1 "��"!~/[��-��]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 "��"!~/[��-��]/i $^X $__FILE__\n};
}

if ("��" =~ /[��-��]/i) {
    print qq{ok - 2 "��"=~/[��-��]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 2 "��"=~/[��-��]/i $^X $__FILE__\n};
}

if ("��" =~ /[��-��]/i) {
    print qq{ok - 3 "��"=~/[��-��]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 3 "��"=~/[��-��]/i $^X $__FILE__\n};
}

if ("��" =~ /[��-��]/i) {
    print qq{ok - 4 "��"=~/[��-��]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 4 "��"=~/[��-��]/i $^X $__FILE__\n};
}

if ("��" !~ /[��-��]/i) {
    print qq{ok - 5 "��"!~/[��-��]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 5 "��"!~/[��-��]/i $^X $__FILE__\n};
}

my $from = '��';
if ("��" !~ /[$from-��]/i) {
    print qq{ok - 6 "��"!~/[\$from-��]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 6 "��"!~/[\$from-��]/i $^X $__FILE__\n};
}

if ("��" =~ /[$from-��]/i) {
    print qq{ok - 7 "��"=~/[\$from-��]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 7 "��"=~/[\$from-��]/i $^X $__FILE__\n};
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
if ("��" !~ /[$from-$to]/i) {
    print qq{ok - 11 "��"!~/[\$from-\$to]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 11 "��"!~/[\$from-\$to]/i $^X $__FILE__\n};
}

if ("��" =~ /[$from-$to]/i) {
    print qq{ok - 12 "��"=~/[\$from-\$to]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 12 "��"=~/[\$from-\$to]/i $^X $__FILE__\n};
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

if ("��" !~ /[${from}-${to}]/i) {
    print qq{ok - 16 "��"!~/[\${from}-\${to}]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 16 "��"!~/[\${from}-\${to}]/i $^X $__FILE__\n};
}

if ("��" =~ /[${from}-${to}]/i) {
    print qq{ok - 17 "��"=~/[\${from}-\${to}]/i $^X $__FILE__\n};
}
else {
    print qq{not ok - 17 "��"=~/[\${from}-\${to}]/i $^X $__FILE__\n};
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
