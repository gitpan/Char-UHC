# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{あ} ne "\x82\xa0";

# Char::Euhc::X と -X (Perlのファイルテスト演算子) の結果が一致することのテスト(対象はディレクトリ)

my $__FILE__ = __FILE__;

use Char::Euhc;
print "1..22\n";

if ($^O !~ /\A (?: MSWin32 | NetWare | symbian | dos ) \z/oxms) {
    for my $tno (1..22) {
        print "ok - $tno # SKIP $^X $0\n";
    }
    exit;
}

mkdir('directory',0777);

opendir(DIR,'directory');

if (((Char::Euhc::r 'directory') ne '') == ((-r 'directory') ne '')) {
    print "ok - 1 Char::Euhc::r 'directory' == -r 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - 1 Char::Euhc::r 'directory' == -r 'directory' $^X $__FILE__\n";
}

if (((Char::Euhc::w 'directory') ne '') == ((-w 'directory') ne '')) {
    print "ok - 2 Char::Euhc::w 'directory' == -w 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - 2 Char::Euhc::w 'directory' == -w 'directory' $^X $__FILE__\n";
}

if (((Char::Euhc::x 'directory') ne '') == ((-x 'directory') ne '')) {
    print "ok - 3 Char::Euhc::x 'directory' == -x 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - 3 Char::Euhc::x 'directory' == -x 'directory' $^X $__FILE__\n";
}

if (((Char::Euhc::o 'directory') ne '') == ((-o 'directory') ne '')) {
    print "ok - 4 Char::Euhc::o 'directory' == -o 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - 4 Char::Euhc::o 'directory' == -o 'directory' $^X $__FILE__\n";
}

if (((Char::Euhc::R 'directory') ne '') == ((-R 'directory') ne '')) {
    print "ok - 5 Char::Euhc::R 'directory' == -R 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - 5 Char::Euhc::R 'directory' == -R 'directory' $^X $__FILE__\n";
}

if (((Char::Euhc::W 'directory') ne '') == ((-W 'directory') ne '')) {
    print "ok - 6 Char::Euhc::W 'directory' == -W 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - 6 Char::Euhc::W 'directory' == -W 'directory' $^X $__FILE__\n";
}

if (((Char::Euhc::X 'directory') ne '') == ((-X 'directory') ne '')) {
    print "ok - 7 Char::Euhc::X 'directory' == -X 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - 7 Char::Euhc::X 'directory' == -X 'directory' $^X $__FILE__\n";
}

if (((Char::Euhc::O 'directory') ne '') == ((-O 'directory') ne '')) {
    print "ok - 8 Char::Euhc::O 'directory' == -O 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - 8 Char::Euhc::O 'directory' == -O 'directory' $^X $__FILE__\n";
}

if (((Char::Euhc::e 'directory') ne '') == ((-e 'directory') ne '')) {
    print "ok - 9 Char::Euhc::e 'directory' == -e 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - 9 Char::Euhc::e 'directory' == -e 'directory' $^X $__FILE__\n";
}

if (((Char::Euhc::z 'directory') ne '') == ((-z 'directory') ne '')) {
    print "ok - 10 Char::Euhc::z 'directory' == -z 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - 10 Char::Euhc::z 'directory' == -z 'directory' $^X $__FILE__\n";
}

if (((Char::Euhc::s 'directory') ne '') == ((-s 'directory') ne '')) {
    print "ok - 11 Char::Euhc::s 'directory' == -s 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - 11 Char::Euhc::s 'directory' == -s 'directory' $^X $__FILE__\n";
}

if (((Char::Euhc::f 'directory') ne '') == ((-f 'directory') ne '')) {
    print "ok - 12 Char::Euhc::f 'directory' == -f 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - 12 Char::Euhc::f 'directory' == -f 'directory' $^X $__FILE__\n";
}

if (((Char::Euhc::d 'directory') ne '') == ((-d 'directory') ne '')) {
    print "ok - 13 Char::Euhc::d 'directory' == -d 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - 13 Char::Euhc::d 'directory' == -d 'directory' $^X $__FILE__\n";
}

if (((Char::Euhc::p 'directory') ne '') == ((-p 'directory') ne '')) {
    print "ok - 14 Char::Euhc::p 'directory' == -p 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - 14 Char::Euhc::p 'directory' == -p 'directory' $^X $__FILE__\n";
}

if (((Char::Euhc::S 'directory') ne '') == ((-S 'directory') ne '')) {
    print "ok - 15 Char::Euhc::S 'directory' == -S 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - 15 Char::Euhc::S 'directory' == -S 'directory' $^X $__FILE__\n";
}

if (((Char::Euhc::b 'directory') ne '') == ((-b 'directory') ne '')) {
    print "ok - 16 Char::Euhc::b 'directory' == -b 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - 16 Char::Euhc::b 'directory' == -b 'directory' $^X $__FILE__\n";
}

if (((Char::Euhc::c 'directory') ne '') == ((-c 'directory') ne '')) {
    print "ok - 17 Char::Euhc::c 'directory' == -c 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - 17 Char::Euhc::c 'directory' == -c 'directory' $^X $__FILE__\n";
}

if (((Char::Euhc::u 'directory') ne '') == ((-u 'directory') ne '')) {
    print "ok - 18 Char::Euhc::u 'directory' == -u 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - 18 Char::Euhc::u 'directory' == -u 'directory' $^X $__FILE__\n";
}

if (((Char::Euhc::g 'directory') ne '') == ((-g 'directory') ne '')) {
    print "ok - 19 Char::Euhc::g 'directory' == -g 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - 19 Char::Euhc::g 'directory' == -g 'directory' $^X $__FILE__\n";
}

if (((Char::Euhc::M 'directory') ne '') == ((-M 'directory') ne '')) {
    print "ok - 20 Char::Euhc::M 'directory' == -M 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - 20 Char::Euhc::M 'directory' == -M 'directory' $^X $__FILE__\n";
}

if (((Char::Euhc::A 'directory') ne '') == ((-A 'directory') ne '')) {
    print "ok - 21 Char::Euhc::A 'directory' == -A 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - 21 Char::Euhc::A 'directory' == -A 'directory' $^X $__FILE__\n";
}

if (((Char::Euhc::C 'directory') ne '') == ((-C 'directory') ne '')) {
    print "ok - 22 Char::Euhc::C 'directory' == -C 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - 22 Char::Euhc::C 'directory' == -C 'directory' $^X $__FILE__\n";
}

closedir(DIR);
rmdir('directory');

__END__
