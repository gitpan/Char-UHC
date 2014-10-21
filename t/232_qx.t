# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Char::UHC;
print "1..2\n";

if ($^O !~ /\A (?: MSWin32 | NetWare | symbian | dos ) \z/oxms) {
    print "ok - 1 # SKIP $^X $0\n";
    print "ok - 2 # SKIP $^X $0\n";
    exit;
}

my @qx = ();

mkdir('directory',0777);
system('echo 1 >directory\\qx.txt');
if ($ENV{'COMSPEC'} =~ / \\COMMAND\.COM \z/oxmsi) {
    @qx = split /\n/, `dir /b directory`;
}
else{
    @qx = split /\n/, `dir /b directory 2>NUL`;
}
if (@qx) {
    print "ok - 1 qx $^X $__FILE__\n";
}
else {
    print "not ok - 1 qx: $! $^X $__FILE__\n";
}
system('del directory\\qx.txt');
rmdir('directory');

mkdir('D�@�\',0777);
system('echo 1 >D�@�\\\qx.txt');
if ($ENV{'COMSPEC'} =~ / \\COMMAND\.COM \z/oxmsi) {
    @qx = split /\n/, `dir /b D�@�\`;
}
else{
    @qx = split /\n/, `dir /b D�@�\ 2>NUL`;
}
if (@qx) {
    print "ok - 2 qx $^X $__FILE__\n";
}
else {
    print "not ok - 2 qx: $! $^X $__FILE__\n";
}
system('del D�@�\\\qx.txt');
rmdir('D�@�\');

__END__
