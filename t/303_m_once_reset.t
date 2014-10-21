# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use strict;
use Char::UHC;
print "1..8\n";

my $__FILE__ = __FILE__;

# Test::Harness::runtests() and reset() make "Error: Runtime exception".
#
# t/303_m_once_reset........Error: Runtime exception
# Error: Runtime exception
# Can't spawn "cmd.exe": No such file or directory at Foo.pm line NNN.
# Callback called exit at t/303_m_once_reset.t line NNN.
# BEGIN failed--compilation aborted at t/303_m_once_reset.t line NNN.
# dubious
#         Test returned status 2 (wstat 512, 0x200)
# DIED. FAILED tests 1-8
#         Failed 8/8 tests, 0.00% okay

if ($] =~ /^5\.005/) {
    for my $tno (1 .. 8) {
        print qq{ok - $tno # SKIP $^X/$] $^O $__FILE__\n};
    }
    exit;
}

my @m_once = ();

@m_once = ();
for (qw(������ ������ ������)) {
    if ($_ =~ ?������?) {
        push @m_once, 1;
    }
    else {
        push @m_once, 0;
    }
    reset;
}
if (join(',',@m_once) eq '1,1,1') {
    print qq{ok - 1 ?������?; reset $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 ?������?; reset $^X $__FILE__\n};
}

@m_once = ();
my $re = '';
for (qw(������ ������ ������)) {
    $re = $_;
    if ($_ =~ ?$re?o) {
        push @m_once, 1;
    }
    else {
        push @m_once, 0;
    }
    reset;
}
if (join(',',@m_once) eq '1,0,0') {
    print qq{ok - 2 ?\$re?o; reset $^X $__FILE__\n};
}
else {
    print qq{not ok - 2 ?\$re?o; reset $^X $__FILE__\n};
}

@m_once = ();
for (qw(������ ������ ������)) {
    if ($_ =~ ? �� �� �� ?x) {
        push @m_once, 1;
    }
    else {
        push @m_once, 0;
    }
    reset;
}
if (join(',',@m_once) eq '1,1,1') {
    print qq{ok - 3 ? �� �� �� ?x; reset $^X $__FILE__\n};
}
else {
    print qq{not ok - 3 ? �� �� �� ?x; reset $^X $__FILE__\n};
}

@m_once = ();
for ("������\n������","������\n������","������\n������") {
    if ($_ =~ ?^������?m) {
        push @m_once, 1;
    }
    else {
        push @m_once, 0;
    }
    reset;
}
if (join(',',@m_once) eq '1,1,1') {
    print qq{ok - 4 ?^������?m; reset $^X $__FILE__\n};
}
else {
    print qq{not ok - 4 ?^������?m; reset $^X $__FILE__\n};
}

@m_once = ();
for ("��\n��","��\n��","��\n��") {
    if ($_ =~ ?��.��?s) {
        push @m_once, 1;
    }
    else {
        push @m_once, 0;
    }
    reset;
}
if (join(',',@m_once) eq '1,1,1') {
    print qq{ok - 5 ?��.��?s; reset $^X $__FILE__\n};
}
else {
    print qq{not ok - 5 ?��.��?s; reset $^X $__FILE__\n};
}

@m_once = ();
for (qw(AAA AAA AAA)) {
    if ($_ =~ ?aaa?i) {
        push @m_once, 1;
    }
    else {
        push @m_once, 0;
    }
    reset;
}
if (join(',',@m_once) eq '1,1,1') {
    print qq{ok - 6 ?aaa?i; reset $^X $__FILE__\n};
}
else {
    print qq{not ok - 6 ?aaa?i; reset $^X $__FILE__\n};
}

@m_once = ();
for (qw(������ ������ ������)) {
    if ($_ =~ ?������?g) {
        push @m_once, 1;
    }
    else {
        push @m_once, 0;
    }
    reset;
}
if (join(',',@m_once) eq '1,1,1') {
    print qq{ok - 7 ?������?g; reset $^X $__FILE__\n};
}
else {
    print qq{not ok - 7 ?������?g; reset $^X $__FILE__\n};
}

@m_once = ();
for (qw(������ ������ ������)) {
    if ($_ =~ ?������?gc) {
        push @m_once, 1;
    }
    else {
        push @m_once, 0;
    }
    reset;
}
if (join(',',@m_once) eq '1,1,1') {
    print qq{ok - 8 ?������?gc; reset $^X $__FILE__\n};
}
else {
    print qq{not ok - 8 ?������?gc; reset $^X $__FILE__\n};
}

__END__

