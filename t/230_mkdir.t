# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Char::UHC;
print "1..1\n";

if ($^O !~ /\A (?: MSWin32 | NetWare | symbian | dos ) \z/oxms) {
    print "ok - 1 # SKIP $^X $0\n";
    exit;
}

if ($ENV{'COMSPEC'} =~ / \\COMMAND\.COM \z/oxmsi) {
    system('rmdir D2�@�\');
}
else {
    system('rmdir D2�@�\ 2>NUL');
}

# mkdir
if (mkdir('D2�@�\',0777)) {
    print "ok - 1 mkdir $^X $__FILE__\n";
}
else {
    print "not ok - 1 mkdir: $! $^X $__FILE__\n";
}

if ($ENV{'COMSPEC'} =~ / \\COMMAND\.COM \z/oxmsi) {
    system('rmdir D2�@�\');
}
else {
    system('rmdir D2�@�\ 2>NUL');
}

__END__
