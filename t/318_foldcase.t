# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use Char::UHC;
print "1..13\n";

if (fc('ABCDEF') eq fc('abcdef')) {
    print qq{ok - 1 fc('ABCDEF') eq fc('abcdef')\n};
}
else {
    print qq{not ok - 1 fc('ABCDEF') eq fc('abcdef')\n};
}

if (fc('�A�C�E�G�I') eq '�A�C�E�G�I') {
    print qq{ok - 2 fc('�A�C�E�G�I') eq '�A�C�E�G�I'\n};
}
else {
    print qq{not ok - 2 fc('�A�C�E�G�I') eq '�A�C�E�G�I'\n};
}

if ("\FABCDEF\E" eq "\Fabcdef\E") {
    print qq{ok - 3 "\\FABCDEF\\E" eq "\\Fabcdef\\E"\n};
}
else {
    print qq{not ok - 3 "\\FABCDEF\\E" eq "\\Fabcdef\\E"\n};
}

if ("\F�A�C�E�G�I\E" eq "�A�C�E�G�I") {
    print qq{ok - 4 "\\F�A�C�E�G�I\\E" eq "�A�C�E�G�I"\n};
}
else {
    print qq{not ok - 4 "\\F�A�C�E�G�I\\E" eq "�A�C�E�G�I"\n};
}

if ("\FABCDEF\E" =~ /\Fabcdef\E/) {
    print qq{ok - 5 "\\FABCDEF\\E" =~ /\\Fabcdef\\E/\n};
}
else {
    print qq{not ok - 5 "\\FABCDEF\\E" =~ /\\Fabcdef\\E/\n};
}

if ("\Fabcdef\E" =~ /\FABCDEF\E/) {
    print qq{ok - 6 "\\Fabcdef\\E" =~ /\\FABCDEF\\E/\n};
}
else {
    print qq{not ok - 6 "\\Fabcdef\\E" =~ /\\FABCDEF\\E/\n};
}

if ("\FABCDEF\E" =~ /\Fabcdef\E/i) {
    print qq{ok - 7 "\\FABCDEF\\E" =~ /\\Fabcdef\\E/i\n};
}
else {
    print qq{not ok - 7 "\\FABCDEF\\E" =~ /\\Fabcdef\\E/i\n};
}

if ("\Fabcdef\E" =~ /\FABCDEF\E/i) {
    print qq{ok - 8 "\\Fabcdef\\E" =~ /\\FABCDEF\\E/i\n};
}
else {
    print qq{not ok - 8 "\\Fabcdef\\E" =~ /\\FABCDEF\\E/i\n};
}

my $var = 'abcdef';
if ("\FABCDEF\E" =~ /\F$var\E/i) {
    print qq{ok - 9 "\\FABCDEF\\E" =~ /\\F\$var\\E/i\n};
}
else {
    print qq{not ok - 9 "\\FABCDEF\\E" =~ /\\F\$var\\E/i\n};
}

$var = 'ABCDEF';
if ("\Fabcdef\E" =~ /\F$var\E/i) {
    print qq{ok - 10 "\\Fabcdef\\E" =~ /\\F\$var\\E/i\n};
}
else {
    print qq{not ok - 10 "\\Fabcdef\\E" =~ /\\F\$var\\E/i\n};
}

if ("�A�C�E�G�I" =~ /\F�A�C�E�G�I\E/) {
    print qq{ok - 11 "�A�C�E�G�I" =~ /\\F�A�C�E�G�I\\E/\n};
}
else {
    print qq{not ok - 11 "�A�C�E�G�I" =~ /\\F�A�C�E�G�I\\E/\n};
}

if ("�A�C�E�G�I" =~ /\F�A�C�E�G�I\E/i) {
    print qq{ok - 12 "�A�C�E�G�I" =~ /\\F�A�C�E�G�I\\E/i\n};
}
else {
    print qq{not ok - 12 "�A�C�E�G�I" =~ /\\F�A�C�E�G�I\\E/i\n};
}

$var = '�A�C�E�G�I';
if ("�A�C�E�G�I" =~ /\F$var\E/i) {
    print qq{ok - 13 "�A�C�E�G�I" =~ /\\F\$var\\E/i\n};
}
else {
    print qq{not ok - 13 "�A�C�E�G�I" =~ /\\F\$var\\E/i\n};
}

__END__

