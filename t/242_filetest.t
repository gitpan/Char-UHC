# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{あ} ne "\x82\xa0";

# 引数に _ が指定された場合のテスト

my $__FILE__ = __FILE__;

use Char::Euhc;
print "1..23\n";

if ($^O !~ /\A (?: MSWin32 | NetWare | symbian | dos ) \z/oxms) {
    for my $tno (1..23) {
        print "ok - $tno # SKIP $^X $0\n";
    }
    exit;
}

open(FILE,'>file');
close(FILE);

open(FILE,'file');

if (-r ('file')) {
    if (Char::Euhc::r(_)) {
        print "ok - 1 Char::Euhc::r _ == -r _ $^X $__FILE__\n";
    }
    else {
        print "not ok - 1 Char::Euhc::r _ == -r _ $^X $__FILE__\n";
    }
}
else {
    if (Char::Euhc::r(_)) {
        print "not ok - 1 Char::Euhc::r _ == -r _ $^X $__FILE__\n";
    }
    else {
        print "ok - 1 Char::Euhc::r _ == -r _ $^X $__FILE__\n";
    }
}

if (-w ('file')) {
    if (Char::Euhc::w(_)) {
        print "ok - 2 Char::Euhc::w _ == -w _ $^X $__FILE__\n";
    }
    else {
        print "not ok - 2 Char::Euhc::w _ == -w _ $^X $__FILE__\n";
    }
}
else {
    if (Char::Euhc::w(_)) {
        print "not ok - 2 Char::Euhc::w _ == -w _ $^X $__FILE__\n";
    }
    else {
        print "ok - 2 Char::Euhc::w _ == -w _ $^X $__FILE__\n";
    }
}

if (-x ('file')) {
    if (Char::Euhc::x(_)) {
        print "ok - 3 Char::Euhc::x _ == -x _ $^X $__FILE__\n";
    }
    else {
        print "not ok - 3 Char::Euhc::x _ == -x _ $^X $__FILE__\n";
    }
}
else {
    if (Char::Euhc::x(_)) {
        print "not ok - 3 Char::Euhc::x _ == -x _ $^X $__FILE__\n";
    }
    else {
        print "ok - 3 Char::Euhc::x _ == -x _ $^X $__FILE__\n";
    }
}

if (-o ('file')) {
    if (Char::Euhc::o(_)) {
        print "ok - 4 Char::Euhc::o _ == -o _ $^X $__FILE__\n";
    }
    else {
        print "not ok - 4 Char::Euhc::o _ == -o _ $^X $__FILE__\n";
    }
}
else {
    if (Char::Euhc::o(_)) {
        print "not ok - 4 Char::Euhc::o _ == -o _ $^X $__FILE__\n";
    }
    else {
        print "ok - 4 Char::Euhc::o _ == -o _ $^X $__FILE__\n";
    }
}

if (-R ('file')) {
    if (Char::Euhc::R(_)) {
        print "ok - 5 Char::Euhc::R _ == -R _ $^X $__FILE__\n";
    }
    else {
        print "not ok - 5 Char::Euhc::R _ == -R _ $^X $__FILE__\n";
    }
}
else {
    if (Char::Euhc::R(_)) {
        print "not ok - 5 Char::Euhc::R _ == -R _ $^X $__FILE__\n";
    }
    else {
        print "ok - 5 Char::Euhc::R _ == -R _ $^X $__FILE__\n";
    }
}

if (-W ('file')) {
    if (Char::Euhc::W(_)) {
        print "ok - 6 Char::Euhc::W _ == -W _ $^X $__FILE__\n";
    }
    else {
        print "not ok - 6 Char::Euhc::W _ == -W _ $^X $__FILE__\n";
    }
}
else {
    if (Char::Euhc::W(_)) {
        print "not ok - 6 Char::Euhc::W _ == -W _ $^X $__FILE__\n";
    }
    else {
        print "ok - 6 Char::Euhc::W _ == -W _ $^X $__FILE__\n";
    }
}

if (-X ('file')) {
    if (Char::Euhc::X(_)) {
        print "ok - 7 Char::Euhc::X _ == -X _ $^X $__FILE__\n";
    }
    else {
        print "not ok - 7 Char::Euhc::X _ == -X _ $^X $__FILE__\n";
    }
}
else {
    if (Char::Euhc::X(_)) {
        print "not ok - 7 Char::Euhc::X _ == -X _ $^X $__FILE__\n";
    }
    else {
        print "ok - 7 Char::Euhc::X _ == -X _ $^X $__FILE__\n";
    }
}

if (-O ('file')) {
    if (Char::Euhc::O(_)) {
        print "ok - 8 Char::Euhc::O _ == -O _ $^X $__FILE__\n";
    }
    else {
        print "not ok - 8 Char::Euhc::O _ == -O _ $^X $__FILE__\n";
    }
}
else {
    if (Char::Euhc::O(_)) {
        print "not ok - 8 Char::Euhc::O _ == -O _ $^X $__FILE__\n";
    }
    else {
        print "ok - 8 Char::Euhc::O _ == -O _ $^X $__FILE__\n";
    }
}

if (-e ('file')) {
    if (Char::Euhc::e(_)) {
        print "ok - 9 Char::Euhc::e _ == -e _ $^X $__FILE__\n";
    }
    else {
        print "not ok - 9 Char::Euhc::e _ == -e _ $^X $__FILE__\n";
    }
}
else {
    if (Char::Euhc::e(_)) {
        print "not ok - 9 Char::Euhc::e _ == -e _ $^X $__FILE__\n";
    }
    else {
        print "ok - 9 Char::Euhc::e _ == -e _ $^X $__FILE__\n";
    }
}

if (-z ('file')) {
    if (Char::Euhc::z(_)) {
        print "ok - 10 Char::Euhc::z _ == -z _ $^X $__FILE__\n";
    }
    else {
        print "not ok - 10 Char::Euhc::z _ == -z _ $^X $__FILE__\n";
    }
}
else {
    if (Char::Euhc::z(_)) {
        print "not ok - 10 Char::Euhc::z _ == -z _ $^X $__FILE__\n";
    }
    else {
        print "ok - 10 Char::Euhc::z _ == -z _ $^X $__FILE__\n";
    }
}

$_ = -s 'file';
if (Char::Euhc::s(_) == $_) {
    print "ok - 11 Char::Euhc::s _ (@{[Char::Euhc::s _]}) == -s 'file' ($_) $^X $__FILE__\n";
}
else {
    print "not ok - 11 Char::Euhc::s _ (@{[Char::Euhc::s _]}) == -s 'file' ($_) $^X $__FILE__\n";
}

if (-f ('file')) {
    if (Char::Euhc::f(_)) {
        print "ok - 12 Char::Euhc::f _ == -f _ $^X $__FILE__\n";
    }
    else {
        print "not ok - 12 Char::Euhc::f _ == -f _ $^X $__FILE__\n";
    }
}
else {
    if (Char::Euhc::f(_)) {
        print "not ok - 12 Char::Euhc::f _ == -f _ $^X $__FILE__\n";
    }
    else {
        print "ok - 12 Char::Euhc::f _ == -f _ $^X $__FILE__\n";
    }
}

if (-d ('file')) {
    if (Char::Euhc::d(_)) {
        print "ok - 13 Char::Euhc::d _ == -d _ $^X $__FILE__\n";
    }
    else {
        print "not ok - 13 Char::Euhc::d _ == -d _ $^X $__FILE__\n";
    }
}
else {
    if (Char::Euhc::d(_)) {
        print "not ok - 13 Char::Euhc::d _ == -d _ $^X $__FILE__\n";
    }
    else {
        print "ok - 13 Char::Euhc::d _ == -d _ $^X $__FILE__\n";
    }
}

if (-p ('file')) {
    if (Char::Euhc::p(_)) {
        print "ok - 14 Char::Euhc::p _ == -p _ $^X $__FILE__\n";
    }
    else {
        print "not ok - 14 Char::Euhc::p _ == -p _ $^X $__FILE__\n";
    }
}
else {
    if (Char::Euhc::p(_)) {
        print "not ok - 14 Char::Euhc::p _ == -p _ $^X $__FILE__\n";
    }
    else {
        print "ok - 14 Char::Euhc::p _ == -p _ $^X $__FILE__\n";
    }
}

if (-S ('file')) {
    if (Char::Euhc::S(_)) {
        print "ok - 15 Char::Euhc::S _ == -S _ $^X $__FILE__\n";
    }
    else {
        print "not ok - 15 Char::Euhc::S _ == -S _ $^X $__FILE__\n";
    }
}
else {
    if (Char::Euhc::S(_)) {
        print "not ok - 15 Char::Euhc::S _ == -S _ $^X $__FILE__\n";
    }
    else {
        print "ok - 15 Char::Euhc::S _ == -S _ $^X $__FILE__\n";
    }
}

if (-b ('file')) {
    if (Char::Euhc::b(_)) {
        print "ok - 16 Char::Euhc::b _ == -b _ $^X $__FILE__\n";
    }
    else {
        print "not ok - 16 Char::Euhc::b _ == -b _ $^X $__FILE__\n";
    }
}
else {
    if (Char::Euhc::b(_)) {
        print "not ok - 16 Char::Euhc::b _ == -b _ $^X $__FILE__\n";
    }
    else {
        print "ok - 16 Char::Euhc::b _ == -b _ $^X $__FILE__\n";
    }
}

if (-c ('file')) {
    if (Char::Euhc::c(_)) {
        print "ok - 17 Char::Euhc::c _ == -c _ $^X $__FILE__\n";
    }
    else {
        print "not ok - 17 Char::Euhc::c _ == -c _ $^X $__FILE__\n";
    }
}
else {
    if (Char::Euhc::c(_)) {
        print "not ok - 17 Char::Euhc::c _ == -c _ $^X $__FILE__\n";
    }
    else {
        print "ok - 17 Char::Euhc::c _ == -c _ $^X $__FILE__\n";
    }
}

if (-u ('file')) {
    if (Char::Euhc::u(_)) {
        print "ok - 18 Char::Euhc::u _ == -u _ $^X $__FILE__\n";
    }
    else {
        print "not ok - 18 Char::Euhc::u _ == -u _ $^X $__FILE__\n";
    }
}
else {
    if (Char::Euhc::u(_)) {
        print "not ok - 18 Char::Euhc::u _ == -u _ $^X $__FILE__\n";
    }
    else {
        print "ok - 18 Char::Euhc::u _ == -u _ $^X $__FILE__\n";
    }
}

if (-g ('file')) {
    if (Char::Euhc::g(_)) {
        print "ok - 19 Char::Euhc::g _ == -g _ $^X $__FILE__\n";
    }
    else {
        print "not ok - 19 Char::Euhc::g _ == -g _ $^X $__FILE__\n";
    }
}
else {
    if (Char::Euhc::g(_)) {
        print "not ok - 19 Char::Euhc::g _ == -g _ $^X $__FILE__\n";
    }
    else {
        print "ok - 19 Char::Euhc::g _ == -g _ $^X $__FILE__\n";
    }
}

if (-k ('file')) {
    if (Char::Euhc::k(_)) {
        print "ok - 20 Char::Euhc::k _ == -k _ $^X $__FILE__\n";
    }
    else {
        print "not ok - 20 Char::Euhc::k _ == -k _ $^X $__FILE__\n";
    }
}
else {
    if (Char::Euhc::k(_)) {
        print "not ok - 20 Char::Euhc::k _ == -k _ $^X $__FILE__\n";
    }
    else {
        print "ok - 20 Char::Euhc::k _ == -k _ $^X $__FILE__\n";
    }
}

$_ = -M 'file';
if (Char::Euhc::M(_) == $_) {
    print "ok - 21 Char::Euhc::M _ (@{[Char::Euhc::M _]}) == -M 'file' ($_) $^X $__FILE__\n";
}
else {
    print "not ok - 21 Char::Euhc::M _ (@{[Char::Euhc::M _]}) == -M 'file' ($_) $^X $__FILE__\n";
}

$_ = -A 'file';
if (Char::Euhc::A(_) == $_) {
    print "ok - 22 Char::Euhc::A _ (@{[Char::Euhc::A _]}) == -A 'file' ($_) $^X $__FILE__\n";
}
else {
    print "not ok - 22 Char::Euhc::A _ (@{[Char::Euhc::A _]}) == -A 'file' ($_) $^X $__FILE__\n";
}

$_ = -C 'file';
if (Char::Euhc::C(_) == $_) {
    print "ok - 23 Char::Euhc::C _ (@{[Char::Euhc::C _]}) == -C 'file' ($_) $^X $__FILE__\n";
}
else {
    print "not ok - 23 Char::Euhc::C _ (@{[Char::Euhc::C _]}) == -C 'file' ($_) $^X $__FILE__\n";
}

close(FILE);
unlink('file');

__END__
