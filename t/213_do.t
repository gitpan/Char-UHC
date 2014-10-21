# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use Char::UHC;
print "1..2\n";

my $__FILE__ = __FILE__;

if ($^O eq 'MacOS') {
    print "ok - 1 # SKIP $^X $0\n";
    print "ok - 2 # SKIP $^X $0\n";
    exit;
}

my $chcp = '';
if ($^O =~ /\A (?: MSWin32 | NetWare | symbian | dos ) \z/oxms) {
    $chcp = `chcp`;
}
if ($chcp !~ /932/oxms) {
    print "ok - 1 # SKIP $^X $0\n";
    print "ok - 2 # SKIP $^X $0\n";
    exit;
}

open(FILE,'>file') || die "Can't open file: file\n";
print FILE "1\n";
close(FILE);
if (do 'file') {
    print "ok - 1 do $^X $__FILE__\n";
}
else {
    print "not ok - 1 do: $! $^X $__FILE__\n";
}
unlink('file');

open(FILE,'>F�@�\') || die "Can't open file: F�@�\\n";
print FILE "1\n";
close(FILE);
if (do 'F�@�\') {
    print "ok - 2 do $^X $__FILE__\n";
}
else {
    print "not ok - 2 do: $! $^X $__FILE__\n";
}
unlink('F�@�\');

__END__
