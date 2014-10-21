# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use Char::UHC;
BEGIN {
    print "1..9\n";
    if ($] >= 5.020) {
        require feature;
        feature->import('signatures');
        require warnings;
        warnings->unimport('experimental::signatures');
    }
    else {
        for my $tno (1 .. 9) {
            print qq{ok - $tno SKIP $^X @{[__FILE__]}\n};
        }
        exit;
    }
}

sub f001 ($a="�\") { $a }
if (f001() eq "�\") {
    print qq{ok - 1 sub f001 (\$a="�\") $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 1 sub f001 (\$a="�\") $^X @{[__FILE__]}\n};
}

sub f002 ($a=qq{�\}) { $a }
if (f002() eq '�\') {
    print qq{ok - 2 sub f002 (\$a=qq{�\}) $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 2 sub f002 (\$a=qq{�\}) $^X @{[__FILE__]}\n};
}

sub f003 ($a=<<END) { $a }
�\
END
if (f003() eq "�\\n") {
    print qq{ok - 3 sub f003 (\$a=<<END) $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 3 sub f003 (\$a=<<END) $^X @{[__FILE__]}\n};
}

sub f004 ($a=<<"END") { $a }
�\
END
if (f004() eq "�\\n") {
    print qq{ok - 4 sub f004 (\$a=<<"END") $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 4 sub f004 (\$a=<<"END") $^X @{[__FILE__]}\n};
}

sub f005 ($a='�\') { $a }
if (f005() eq '�\') {
    print qq{ok - 5 sub f005 (\$a='�\') $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 5 sub f005 (\$a='�\') $^X @{[__FILE__]}\n};
}

sub f006 ($a=q{�\}) { $a }
if (f006() eq '�\') {
    print qq{ok - 6 sub f006 (\$a=q{�\}) $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 6 sub f006 (\$a=q{�\}) $^X @{[__FILE__]}\n};
}

sub f007 ($a=<<'END') { $a }
�\
END
if (f007() eq "�\\n") {
    print qq{ok - 7 sub f007 (\$a=<<'END') $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 7 sub f007 (\$a=<<'END') $^X @{[__FILE__]}\n};
}

sub f008 ($a=qr{�\}) { $a }
if ('�\' =~ f008()) {
    print qq{ok - 8 sub f008 (\$a=qr{�\}) $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 8 sub f008 (\$a=qr{�\}) $^X @{[__FILE__]}\n};
}

sub f009 ($a=qr'�\') { $a }
if ('�\' =~ f009()) {
    print qq{ok - 9 sub f009 (\$a=qr'�\') $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 9 sub f009 (\$a=qr'�\') $^X @{[__FILE__]}\n};
}

__END__
