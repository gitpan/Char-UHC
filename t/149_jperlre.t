# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

print "1..2\n";

my $__FILE__ = __FILE__;

if ($^O eq 'MacOS') {
    print "ok - 1 # SKIP $^X $__FILE__\n";
    print "ok - 2 # SKIP $^X $__FILE__\n";
    exit;
}

my $null = '';
if ($^O =~ /\A (?: MSWin32 | NetWare | symbian | dos ) \z/oxms) {
    if (($ENV{'PERL5SHELL'}||$ENV{'COMSPEC'}) =~ / \\COMMAND\.COM \z/oxmsi) {
        $null = '';
    }
    else {
        $null = '2>NUL';
    }
}
else{
    $null = '2>/dev/null';
}

my $script = __FILE__ . '.pl';

open(TEST,">$script") || die "Can't open file: $script\n";
print TEST <<'END';
use Char::UHC;
'-' =~ /(��[��-��])/;
print "PASS\n";
END
close(TEST);
eval {
    $result = qx{$^X $script $null};
};
if ($result =~ /PASS/) {
    print "ok - 1 $^X $__FILE__ die ('-' =~ /��[��-��]/).\n";
}
else {
    print "not ok - 1 $^X $__FILE__ die ('-' =~ /��[��-��]/).\n";
}
unlink("$script");
unlink("$script.e");

open(TEST,">$script") || die "Can't open file: $script\n";
print TEST <<'END';
use Char::UHC;
'-' =~ /(��[��-��])/;
print "PASS\n";
END
close(TEST);
eval {
    $result = qx{$^X $script $null};
};
if ($result !~ /PASS/) {
    print "ok - 2 $^X $__FILE__ die ('-' =~ /��[��-��]/).\n";
}
else {
    print "not ok - 2 $^X $__FILE__ die ('-' =~ /��[��-��]/).\n";
}
unlink("$script");
unlink("$script.e");

__END__

