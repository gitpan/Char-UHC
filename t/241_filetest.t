# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{‚ } ne "\x82\xa0";

# ˆø”‚ªÈ—ª‚³‚ê‚½ê‡‚ÌƒeƒXƒg

my $__FILE__ = __FILE__;

use Char::Euhc;
print "1..24\n";

if ($^O !~ /\A (?: MSWin32 | NetWare | symbian | dos ) \z/oxms) {
    for my $tno (1..24) {
        print "ok - $tno # SKIP $^X $0\n";
    }
    exit;
}

open(FILE,'>file');
close(FILE);

open(FILE,'file');

$_ = 'file';
if ((Char::Euhc::r_ ne '') == (-r ne '')) {
    print "ok - 1 Char::Euhc::r_ == -r  $^X $__FILE__\n";
}
else {
    print "not ok - 1 Char::Euhc::r_ == -r  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::w_ ne '') == (-w ne '')) {
    print "ok - 2 Char::Euhc::w_ == -w  $^X $__FILE__\n";
}
else {
    print "not ok - 2 Char::Euhc::w_ == -w  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::x_ ne '') == (-x ne '')) {
    print "ok - 3 Char::Euhc::x_ == -x  $^X $__FILE__\n";
}
else {
    print "not ok - 3 Char::Euhc::x_ == -x  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::o_ ne '') == (-o ne '')) {
    print "ok - 4 Char::Euhc::o_ == -o  $^X $__FILE__\n";
}
else {
    print "not ok - 4 Char::Euhc::o_ == -o  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::R_ ne '') == (-R ne '')) {
    print "ok - 5 Char::Euhc::R_ == -R  $^X $__FILE__\n";
}
else {
    print "not ok - 5 Char::Euhc::R_ == -R  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::W_ ne '') == (-W ne '')) {
    print "ok - 6 Char::Euhc::W_ == -W  $^X $__FILE__\n";
}
else {
    print "not ok - 6 Char::Euhc::W_ == -W  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::X_ ne '') == (-X ne '')) {
    print "ok - 7 Char::Euhc::X_ == -X  $^X $__FILE__\n";
}
else {
    print "not ok - 7 Char::Euhc::X_ == -X  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::O_ ne '') == (-O ne '')) {
    print "ok - 8 Char::Euhc::O_ == -O  $^X $__FILE__\n";
}
else {
    print "not ok - 8 Char::Euhc::O_ == -O  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::e_ ne '') == (-e ne '')) {
    print "ok - 9 Char::Euhc::e_ == -e  $^X $__FILE__\n";
}
else {
    print "not ok - 9 Char::Euhc::e_ == -e  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::z_ ne '') == (-z ne '')) {
    print "ok - 10 Char::Euhc::z_ == -z  $^X $__FILE__\n";
}
else {
    print "not ok - 10 Char::Euhc::z_ == -z  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::s_ ne '') == (-s ne '')) {
    print "ok - 11 Char::Euhc::s_ == -s  $^X $__FILE__\n";
}
else {
    print "not ok - 11 Char::Euhc::s_ == -s  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::f_ ne '') == (-f ne '')) {
    print "ok - 12 Char::Euhc::f_ == -f  $^X $__FILE__\n";
}
else {
    print "not ok - 12 Char::Euhc::f_ == -f  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::d_ ne '') == (-d ne '')) {
    print "ok - 13 Char::Euhc::d_ == -d  $^X $__FILE__\n";
}
else {
    print "not ok - 13 Char::Euhc::d_ == -d  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::p_ ne '') == (-p ne '')) {
    print "ok - 14 Char::Euhc::p_ == -p  $^X $__FILE__\n";
}
else {
    print "not ok - 14 Char::Euhc::p_ == -p  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::S_ ne '') == (-S ne '')) {
    print "ok - 15 Char::Euhc::S_ == -S  $^X $__FILE__\n";
}
else {
    print "not ok - 15 Char::Euhc::S_ == -S  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::b_ ne '') == (-b ne '')) {
    print "ok - 16 Char::Euhc::b_ == -b  $^X $__FILE__\n";
}
else {
    print "not ok - 16 Char::Euhc::b_ == -b  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::c_ ne '') == (-c ne '')) {
    print "ok - 17 Char::Euhc::c_ == -c  $^X $__FILE__\n";
}
else {
    print "not ok - 17 Char::Euhc::c_ == -c  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::u_ ne '') == (-u ne '')) {
    print "ok - 18 Char::Euhc::u_ == -u  $^X $__FILE__\n";
}
else {
    print "not ok - 18 Char::Euhc::u_ == -u  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::g_ ne '') == (-g ne '')) {
    print "ok - 19 Char::Euhc::g_ == -g  $^X $__FILE__\n";
}
else {
    print "not ok - 19 Char::Euhc::g_ == -g  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::T_ ne '') == (-T ne '')) {
    print "ok - 20 Char::Euhc::T_ == -T  $^X $__FILE__\n";
}
else {
    print "not ok - 20 Char::Euhc::T_ == -T  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::B_ ne '') == (-B ne '')) {
    print "ok - 21 Char::Euhc::B_ == -B  $^X $__FILE__\n";
}
else {
    print "not ok - 21 Char::Euhc::B_ == -B  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::M_ ne '') == (-M ne '')) {
    print "ok - 22 Char::Euhc::M_ == -M  $^X $__FILE__\n";
}
else {
    print "not ok - 22 Char::Euhc::M_ == -M  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::A_ ne '') == (-A ne '')) {
    print "ok - 23 Char::Euhc::A_ == -A  $^X $__FILE__\n";
}
else {
    print "not ok - 23 Char::Euhc::A_ == -A  $^X $__FILE__\n";
}

$_ = 'file';
if ((Char::Euhc::C_ ne '') == (-C ne '')) {
    print "ok - 24 Char::Euhc::C_ == -C  $^X $__FILE__\n";
}
else {
    print "not ok - 24 Char::Euhc::C_ == -C  $^X $__FILE__\n";
}

close(FILE);
unlink('file');

__END__
