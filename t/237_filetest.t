# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{あ} ne "\x82\xa0";

# Char::Euhc::X と -X (Perlのファイルテスト演算子) の結果が一致することのテスト

my $__FILE__ = __FILE__;

use Char::Euhc;
print "1..48\n";

if ($^O !~ /\A (?: MSWin32 | NetWare | symbian | dos ) \z/oxms) {
    for my $tno (1..48) {
        print "ok - $tno # SKIP $^X $0\n";
    }
    exit;
}

open(FILE,'>file');
close(FILE);

open(FILE,'file');

if (((Char::Euhc::r 'file') ne '') == ((-r 'file') ne '')) {
    print "ok - 1 Char::Euhc::r 'file' == -r 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 1 Char::Euhc::r 'file' == -r 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::r FILE) ne '') == ((-r FILE) ne '')) {
    print "ok - 2 Char::Euhc::r FILE == -r FILE $^X $__FILE__\n";
}
else {
    print "not ok - 2 Char::Euhc::r FILE == -r FILE $^X $__FILE__\n";
}

if (((Char::Euhc::w 'file') ne '') == ((-w 'file') ne '')) {
    print "ok - 3 Char::Euhc::w 'file' == -w 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 3 Char::Euhc::w 'file' == -w 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::w FILE) ne '') == ((-w FILE) ne '')) {
    print "ok - 4 Char::Euhc::w FILE == -w FILE $^X $__FILE__\n";
}
else {
    print "not ok - 4 Char::Euhc::w FILE == -w FILE $^X $__FILE__\n";
}

if (((Char::Euhc::x 'file') ne '') == ((-x 'file') ne '')) {
    print "ok - 5 Char::Euhc::x 'file' == -x 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 5 Char::Euhc::x 'file' == -x 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::x FILE) ne '') == ((-x FILE) ne '')) {
    print "ok - 6 Char::Euhc::x FILE == -x FILE $^X $__FILE__\n";
}
else {
    print "not ok - 6 Char::Euhc::x FILE == -x FILE $^X $__FILE__\n";
}

if (((Char::Euhc::o 'file') ne '') == ((-o 'file') ne '')) {
    print "ok - 7 Char::Euhc::o 'file' == -o 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 7 Char::Euhc::o 'file' == -o 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::o FILE) ne '') == ((-o FILE) ne '')) {
    print "ok - 8 Char::Euhc::o FILE == -o FILE $^X $__FILE__\n";
}
else {
    print "not ok - 8 Char::Euhc::o FILE == -o FILE $^X $__FILE__\n";
}

if (((Char::Euhc::R 'file') ne '') == ((-R 'file') ne '')) {
    print "ok - 9 Char::Euhc::R 'file' == -R 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 9 Char::Euhc::R 'file' == -R 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::R FILE) ne '') == ((-R FILE) ne '')) {
    print "ok - 10 Char::Euhc::R FILE == -R FILE $^X $__FILE__\n";
}
else {
    print "not ok - 10 Char::Euhc::R FILE == -R FILE $^X $__FILE__\n";
}

if (((Char::Euhc::W 'file') ne '') == ((-W 'file') ne '')) {
    print "ok - 11 Char::Euhc::W 'file' == -W 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 11 Char::Euhc::W 'file' == -W 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::W FILE) ne '') == ((-W FILE) ne '')) {
    print "ok - 12 Char::Euhc::W FILE == -W FILE $^X $__FILE__\n";
}
else {
    print "not ok - 12 Char::Euhc::W FILE == -W FILE $^X $__FILE__\n";
}

if (((Char::Euhc::X 'file') ne '') == ((-X 'file') ne '')) {
    print "ok - 13 Char::Euhc::X 'file' == -X 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 13 Char::Euhc::X 'file' == -X 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::X FILE) ne '') == ((-X FILE) ne '')) {
    print "ok - 14 Char::Euhc::X FILE == -X FILE $^X $__FILE__\n";
}
else {
    print "not ok - 14 Char::Euhc::X FILE == -X FILE $^X $__FILE__\n";
}

if (((Char::Euhc::O 'file') ne '') == ((-O 'file') ne '')) {
    print "ok - 15 Char::Euhc::O 'file' == -O 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 15 Char::Euhc::O 'file' == -O 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::O FILE) ne '') == ((-O FILE) ne '')) {
    print "ok - 16 Char::Euhc::O FILE == -O FILE $^X $__FILE__\n";
}
else {
    print "not ok - 16 Char::Euhc::O FILE == -O FILE $^X $__FILE__\n";
}

if (((Char::Euhc::e 'file') ne '') == ((-e 'file') ne '')) {
    print "ok - 17 Char::Euhc::e 'file' == -e 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 17 Char::Euhc::e 'file' == -e 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::e FILE) ne '') == ((-e FILE) ne '')) {
    print "ok - 18 Char::Euhc::e FILE == -e FILE $^X $__FILE__\n";
}
else {
    print "not ok - 18 Char::Euhc::e FILE == -e FILE $^X $__FILE__\n";
}

if (((Char::Euhc::z 'file') ne '') == ((-z 'file') ne '')) {
    print "ok - 19 Char::Euhc::z 'file' == -z 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 19 Char::Euhc::z 'file' == -z 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::z FILE) ne '') == ((-z FILE) ne '')) {
    print "ok - 20 Char::Euhc::z FILE == -z FILE $^X $__FILE__\n";
}
else {
    print "not ok - 20 Char::Euhc::z FILE == -z FILE $^X $__FILE__\n";
}

if (((Char::Euhc::s 'file') ne '') == ((-s 'file') ne '')) {
    print "ok - 21 Char::Euhc::s 'file' == -s 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 21 Char::Euhc::s 'file' == -s 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::s FILE) ne '') == ((-s FILE) ne '')) {
    print "ok - 22 Char::Euhc::s FILE == -s FILE $^X $__FILE__\n";
}
else {
    print "not ok - 22 Char::Euhc::s FILE == -s FILE $^X $__FILE__\n";
}

if (((Char::Euhc::f 'file') ne '') == ((-f 'file') ne '')) {
    print "ok - 23 Char::Euhc::f 'file' == -f 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 23 Char::Euhc::f 'file' == -f 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::f FILE) ne '') == ((-f FILE) ne '')) {
    print "ok - 24 Char::Euhc::f FILE == -f FILE $^X $__FILE__\n";
}
else {
    print "not ok - 24 Char::Euhc::f FILE == -f FILE $^X $__FILE__\n";
}

if (((Char::Euhc::d 'file') ne '') == ((-d 'file') ne '')) {
    print "ok - 25 Char::Euhc::d 'file' == -d 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 25 Char::Euhc::d 'file' == -d 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::d FILE) ne '') == ((-d FILE) ne '')) {
    print "ok - 26 Char::Euhc::d FILE == -d FILE $^X $__FILE__\n";
}
else {
    print "not ok - 26 Char::Euhc::d FILE == -d FILE $^X $__FILE__\n";
}

if (((Char::Euhc::p 'file') ne '') == ((-p 'file') ne '')) {
    print "ok - 27 Char::Euhc::p 'file' == -p 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 27 Char::Euhc::p 'file' == -p 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::p FILE) ne '') == ((-p FILE) ne '')) {
    print "ok - 28 Char::Euhc::p FILE == -p FILE $^X $__FILE__\n";
}
else {
    print "not ok - 28 Char::Euhc::p FILE == -p FILE $^X $__FILE__\n";
}

if (((Char::Euhc::S 'file') ne '') == ((-S 'file') ne '')) {
    print "ok - 29 Char::Euhc::S 'file' == -S 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 29 Char::Euhc::S 'file' == -S 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::S FILE) ne '') == ((-S FILE) ne '')) {
    print "ok - 30 Char::Euhc::S FILE == -S FILE $^X $__FILE__\n";
}
else {
    print "not ok - 30 Char::Euhc::S FILE == -S FILE $^X $__FILE__\n";
}

if (((Char::Euhc::b 'file') ne '') == ((-b 'file') ne '')) {
    print "ok - 31 Char::Euhc::b 'file' == -b 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 31 Char::Euhc::b 'file' == -b 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::b FILE) ne '') == ((-b FILE) ne '')) {
    print "ok - 32 Char::Euhc::b FILE == -b FILE $^X $__FILE__\n";
}
else {
    print "not ok - 32 Char::Euhc::b FILE == -b FILE $^X $__FILE__\n";
}

if (((Char::Euhc::c 'file') ne '') == ((-c 'file') ne '')) {
    print "ok - 33 Char::Euhc::c 'file' == -c 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 33 Char::Euhc::c 'file' == -c 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::c FILE) ne '') == ((-c FILE) ne '')) {
    print "ok - 34 Char::Euhc::c FILE == -c FILE $^X $__FILE__\n";
}
else {
    print "not ok - 34 Char::Euhc::c FILE == -c FILE $^X $__FILE__\n";
}

if (((Char::Euhc::u 'file') ne '') == ((-u 'file') ne '')) {
    print "ok - 35 Char::Euhc::u 'file' == -u 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 35 Char::Euhc::u 'file' == -u 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::u FILE) ne '') == ((-u FILE) ne '')) {
    print "ok - 36 Char::Euhc::u FILE == -u FILE $^X $__FILE__\n";
}
else {
    print "not ok - 36 Char::Euhc::u FILE == -u FILE $^X $__FILE__\n";
}

if (((Char::Euhc::g 'file') ne '') == ((-g 'file') ne '')) {
    print "ok - 37 Char::Euhc::g 'file' == -g 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 37 Char::Euhc::g 'file' == -g 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::g FILE) ne '') == ((-g FILE) ne '')) {
    print "ok - 38 Char::Euhc::g FILE == -g FILE $^X $__FILE__\n";
}
else {
    print "not ok - 38 Char::Euhc::g FILE == -g FILE $^X $__FILE__\n";
}

if (((Char::Euhc::T 'file') ne '') == ((-T 'file') ne '')) {
    print "ok - 39 Char::Euhc::T 'file' == -T 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 39 Char::Euhc::T 'file' == -T 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::T FILE) ne '') == ((-T FILE) ne '')) {
    print "ok - 40 Char::Euhc::T FILE == -T FILE $^X $__FILE__\n";
}
else {
    print "not ok - 40 Char::Euhc::T FILE == -T FILE $^X $__FILE__\n";
}

if (((Char::Euhc::B 'file') ne '') == ((-B 'file') ne '')) {
    print "ok - 41 Char::Euhc::B 'file' == -B 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 41 Char::Euhc::B 'file' == -B 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::B FILE) ne '') == ((-B FILE) ne '')) {
    print "ok - 42 Char::Euhc::B FILE == -B FILE $^X $__FILE__\n";
}
else {
    print "not ok - 42 Char::Euhc::B FILE == -B FILE $^X $__FILE__\n";
}

if (((Char::Euhc::M 'file') ne '') == ((-M 'file') ne '')) {
    print "ok - 43 Char::Euhc::M 'file' == -M 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 43 Char::Euhc::M 'file' == -M 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::M FILE) ne '') == ((-M FILE) ne '')) {
    print "ok - 44 Char::Euhc::M FILE == -M FILE $^X $__FILE__\n";
}
else {
    print "not ok - 44 Char::Euhc::M FILE == -M FILE $^X $__FILE__\n";
}

if (((Char::Euhc::A 'file') ne '') == ((-A 'file') ne '')) {
    print "ok - 45 Char::Euhc::A 'file' == -A 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 45 Char::Euhc::A 'file' == -A 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::A FILE) ne '') == ((-A FILE) ne '')) {
    print "ok - 46 Char::Euhc::A FILE == -A FILE $^X $__FILE__\n";
}
else {
    print "not ok - 46 Char::Euhc::A FILE == -A FILE $^X $__FILE__\n";
}

if (((Char::Euhc::C 'file') ne '') == ((-C 'file') ne '')) {
    print "ok - 47 Char::Euhc::C 'file' == -C 'file' $^X $__FILE__\n";
}
else {
    print "not ok - 47 Char::Euhc::C 'file' == -C 'file' $^X $__FILE__\n";
}

if (((Char::Euhc::C FILE) ne '') == ((-C FILE) ne '')) {
    print "ok - 48 Char::Euhc::C FILE == -C FILE $^X $__FILE__\n";
}
else {
    print "not ok - 48 Char::Euhc::C FILE == -C FILE $^X $__FILE__\n";
}

close(FILE);
unlink('file');

__END__
