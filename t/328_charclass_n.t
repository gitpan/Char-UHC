# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use Char::UHC;
print "1..20\n";

my $__FILE__ = __FILE__;

if ("��" =~ /[^��-��]/) {
    print qq{ok - 1 "��"=~/[^��-��]/ $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 "��"=~/[^��-��]/ $^X $__FILE__\n};
}

if ("��" !~ /[^��-��]/) {
    print qq{ok - 2 "��"!~/[^��-��]/ $^X $__FILE__\n};
}
else {
    print qq{not ok - 2 "��"!~/[^��-��]/ $^X $__FILE__\n};
}

if ("��" !~ /[^��-��]/) {
    print qq{ok - 3 "��"!~/[^��-��]/ $^X $__FILE__\n};
}
else {
    print qq{not ok - 3 "��"!~/[^��-��]/ $^X $__FILE__\n};
}

if ("��" !~ /[^��-��]/) {
    print qq{ok - 4 "��"!~/[^��-��]/ $^X $__FILE__\n};
}
else {
    print qq{not ok - 4 "��"!~/[^��-��]/ $^X $__FILE__\n};
}

if ("��" =~ /[^��-��]/) {
    print qq{ok - 5 "��"=~/[^��-��]/ $^X $__FILE__\n};
}
else {
    print qq{not ok - 5 "��"=~/[^��-��]/ $^X $__FILE__\n};
}

my $from = '��';
if ("��" =~ /[^$from-��]/) {
    print qq{ok - 6 "��"=~/[^\$from-��]/ $^X $__FILE__\n};
}
else {
    print qq{not ok - 6 "��"=~/[^\$from-��]/ $^X $__FILE__\n};
}

if ("��" !~ /[^$from-��]/) {
    print qq{ok - 7 "��"!~/[^\$from-��]/ $^X $__FILE__\n};
}
else {
    print qq{not ok - 7 "��"!~/[^\$from-��]/ $^X $__FILE__\n};
}

if ("��" !~ /[^$from-��]/) {
    print qq{ok - 8 "��"!~/[^\$from-��]/ $^X $__FILE__\n};
}
else {
    print qq{not ok - 8 "��"!~/[^\$from-��]/ $^X $__FILE__\n};
}

if ("��" !~ /[^$from-��]/) {
    print qq{ok - 9 "��"!~/[^\$from-��]/ $^X $__FILE__\n};
}
else {
    print qq{not ok - 9 "��"!~/[^\$from-��]/ $^X $__FILE__\n};
}

if ("��" =~ /[^$from-��]/) {
    print qq{ok - 10 "��"=~/[^\$from-��]/ $^X $__FILE__\n};
}
else {
    print qq{not ok - 10 "��"=~/[^\$from-��]/ $^X $__FILE__\n};
}

my $to = '��';
if ("��" =~ /[^$from-$to]/) {
    print qq{ok - 11 "��"=~/[^\$from-\$to]/ $^X $__FILE__\n};
}
else {
    print qq{not ok - 11 "��"=~/[^\$from-\$to]/ $^X $__FILE__\n};
}

if ("��" !~ /[^$from-$to]/) {
    print qq{ok - 12 "��"!~/[^\$from-\$to]/ $^X $__FILE__\n};
}
else {
    print qq{not ok - 12 "��"!~/[^\$from-\$to]/ $^X $__FILE__\n};
}

if ("��" !~ /[^$from-$to]/) {
    print qq{ok - 13 "��"!~/[^\$from-\$to]/ $^X $__FILE__\n};
}
else {
    print qq{not ok - 13 "��"!~/[^\$from-\$to]/ $^X $__FILE__\n};
}

if ("��" !~ /[^$from-$to]/) {
    print qq{ok - 14 "��"!~/[^\$from-\$to]/ $^X $__FILE__\n};
}
else {
    print qq{not ok - 14 "��"!~/[^\$from-\$to]/ $^X $__FILE__\n};
}

if ("��" =~ /[^$from-$to]/) {
    print qq{ok - 15 "��"=~/[^\$from-\$to]/ $^X $__FILE__\n};
}
else {
    print qq{not ok - 15 "��"=~/[^\$from-\$to]/ $^X $__FILE__\n};
}

if ("��" =~ /[^${from}-${to}]/) {
    print qq{ok - 16 "��"=~/[^\${from}-\${to}]/ $^X $__FILE__\n};
}
else {
    print qq{not ok - 16 "��"=~/[^\${from}-\${to}]/ $^X $__FILE__\n};
}

if ("��" !~ /[^${from}-${to}]/) {
    print qq{ok - 17 "��"!~/[^\${from}-\${to}]/ $^X $__FILE__\n};
}
else {
    print qq{not ok - 17 "��"!~/[^\${from}-\${to}]/ $^X $__FILE__\n};
}

if ("��" !~ /[^${from}-${to}]/) {
    print qq{ok - 18 "��"!~/[^\${from}-\${to}]/ $^X $__FILE__\n};
}
else {
    print qq{not ok - 18 "��"!~/[^\${from}-\${to}]/ $^X $__FILE__\n};
}

if ("��" !~ /[^${from}-${to}]/) {
    print qq{ok - 19 "��"!~/[^\${from}-\${to}]/ $^X $__FILE__\n};
}
else {
    print qq{not ok - 19 "��"!~/[^\${from}-\${to}]/ $^X $__FILE__\n};
}

if ("��" =~ /[^${from}-${to}]/) {
    print qq{ok - 20 "��"=~/[^\${from}-\${to}]/ $^X $__FILE__\n};
}
else {
    print qq{not ok - 20 "��"=~/[^\${from}-\${to}]/ $^X $__FILE__\n};
}

__END__
