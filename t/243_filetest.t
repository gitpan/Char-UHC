# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{あ} ne "\x82\xa0";

# ファイルテストが真になる場合は 1 が返るテスト

my $__FILE__ = __FILE__;

use Char::Euhc;
print "1..9\n";

if ($^O !~ /\A (?: MSWin32 | NetWare | symbian | dos ) \z/oxms) {
    for my $tno (1..9) {
        print "ok - $tno # SKIP $^X $0\n";
    }
    exit;
}

open(FILE,'>file');
close(FILE);

open(FILE,'file');

if ((Char::Euhc::r 'file') == 1) {
    $_ = Char::Euhc::r 'file';
    print "ok - 1 Char::Euhc::r 'file' ($_) == 1 $^X $__FILE__\n";
}
else {
    $_ = Char::Euhc::r 'file';
    print "not ok - 1 Char::Euhc::r 'file' ($_) == 1 $^X $__FILE__\n";
}

if ((Char::Euhc::w 'file') == 1) {
    $_ = Char::Euhc::w 'file';
    print "ok - 2 Char::Euhc::w 'file' ($_) == 1 $^X $__FILE__\n";
}
else {
    $_ = Char::Euhc::w 'file';
    print "not ok - 2 Char::Euhc::w 'file' ($_) == 1 $^X $__FILE__\n";
}

if ((Char::Euhc::o 'file') == 1) {
    $_ = Char::Euhc::o 'file';
    print "ok - 3 Char::Euhc::o 'file' ($_) == 1 $^X $__FILE__\n";
}
else {
    $_ = Char::Euhc::o 'file';
    print "not ok - 3 Char::Euhc::o 'file' ($_) == 1 $^X $__FILE__\n";
}

if ((Char::Euhc::R 'file') == 1) {
    $_ = Char::Euhc::R 'file';
    print "ok - 4 Char::Euhc::R 'file' ($_) == 1 $^X $__FILE__\n";
}
else {
    $_ = Char::Euhc::R 'file';
    print "not ok - 4 Char::Euhc::R 'file' ($_) == 1 $^X $__FILE__\n";
}

if ((Char::Euhc::W 'file') == 1) {
    $_ = Char::Euhc::W 'file';
    print "ok - 5 Char::Euhc::W 'file' ($_) == 1 $^X $__FILE__\n";
}
else {
    $_ = Char::Euhc::W 'file';
    print "not ok - 5 Char::Euhc::W 'file' ($_) == 1 $^X $__FILE__\n";
}

if ((Char::Euhc::O 'file') == 1) {
    $_ = Char::Euhc::O 'file';
    print "ok - 6 Char::Euhc::O 'file' ($_) == 1 $^X $__FILE__\n";
}
else {
    $_ = Char::Euhc::O 'file';
    print "not ok - 6 Char::Euhc::O 'file' ($_) == 1 $^X $__FILE__\n";
}

if ((Char::Euhc::e 'file') == 1) {
    $_ = Char::Euhc::e 'file';
    print "ok - 7 Char::Euhc::e 'file' ($_) == 1 $^X $__FILE__\n";
}
else {
    $_ = Char::Euhc::e 'file';
    print "not ok - 7 Char::Euhc::e 'file' ($_) == 1 $^X $__FILE__\n";
}

if ((Char::Euhc::z 'file') == 1) {
    $_ = Char::Euhc::z 'file';
    print "ok - 8 Char::Euhc::z 'file' ($_) == 1 $^X $__FILE__\n";
}
else {
    $_ = Char::Euhc::z 'file';
    print "not ok - 8 Char::Euhc::z 'file' ($_) == 1 $^X $__FILE__\n";
}

if ((Char::Euhc::f 'file') == 1) {
    $_ = Char::Euhc::f 'file';
    print "ok - 9 Char::Euhc::f 'file' ($_) == 1 $^X $__FILE__\n";
}
else {
    $_ = Char::Euhc::f 'file';
    print "not ok - 9 Char::Euhc::f 'file' ($_) == 1 $^X $__FILE__\n";
}

close(FILE);
unlink('file');

__END__
