# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{あ} ne "\x82\xa0";

use Char::UHC;

print "1..12\n";

# Char::UHC::eval <<'END' has Char::UHC::eval "..."
if (Char::UHC::eval <<'END') {
Char::UHC::eval " if ('アソ' !~ /A/) { return 1 } else { return 0 } "
END
    print qq{ok - 1 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 1 $^X @{[__FILE__]}\n};
}

# Char::UHC::eval <<'END' has Char::UHC::eval qq{...}
if (Char::UHC::eval <<'END') {
Char::UHC::eval qq{ if ('アソ' !~ /A/) { return 1 } else { return 0 } }
END
    print qq{ok - 2 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 2 $^X @{[__FILE__]}\n};
}

# Char::UHC::eval <<'END' has Char::UHC::eval '...'
if (Char::UHC::eval <<'END') {
Char::UHC::eval ' if (qq{アソ} !~ /A/) { return 1 } else { return 0 } '
END
    print qq{ok - 3 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 3 $^X @{[__FILE__]}\n};
}

# Char::UHC::eval <<'END' has Char::UHC::eval q{...}
if (Char::UHC::eval <<'END') {
Char::UHC::eval q{ if ('アソ' !~ /A/) { return 1 } else { return 0 } }
END
    print qq{ok - 4 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 4 $^X @{[__FILE__]}\n};
}

# Char::UHC::eval <<'END' has Char::UHC::eval $var
my $var = q{ if ('アソ' !~ /A/) { return 1 } else { return 0 } };
if (Char::UHC::eval <<'END') {
Char::UHC::eval $var
END
    print qq{ok - 5 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 5 $^X @{[__FILE__]}\n};
}

# Char::UHC::eval <<'END' has Char::UHC::eval (omit)
$_ = "if ('アソ' !~ /A/) { return 1 } else { return 0 }";
if (Char::UHC::eval <<'END') {
Char::UHC::eval
END
    print qq{ok - 6 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 6 $^X @{[__FILE__]}\n};
}

# Char::UHC::eval <<'END' has Char::UHC::eval {...}
if (Char::UHC::eval <<'END') {
Char::UHC::eval { if ('アソ' !~ /A/) { return 1 } else { return 0 } }
END
    print qq{ok - 7 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 7 $^X @{[__FILE__]}\n};
}

# Char::UHC::eval <<'END' has "..."
if (Char::UHC::eval <<'END') {
if ('アソ' !~ /A/) { return "1" } else { return "0" }
END
    print qq{ok - 8 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 8 $^X @{[__FILE__]}\n};
}

# Char::UHC::eval <<'END' has qq{...}
if (Char::UHC::eval <<'END') {
if ('アソ' !~ /A/) { return qq{1} } else { return qq{0} }
END
    print qq{ok - 9 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 9 $^X @{[__FILE__]}\n};
}

# Char::UHC::eval <<'END' has '...'
if (Char::UHC::eval <<'END') {
if ('アソ' !~ /A/) { return '1' } else { return '0' }
END
    print qq{ok - 10 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 10 $^X @{[__FILE__]}\n};
}

# Char::UHC::eval <<'END' has q{...}
if (Char::UHC::eval <<'END') {
if ('アソ' !~ /A/) { return q{1} } else { return q{0} }
END
    print qq{ok - 11 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 11 $^X @{[__FILE__]}\n};
}

# Char::UHC::eval <<'END' has $var
my $var1 = 1;
my $var0 = 0;
if (Char::UHC::eval <<'END') {
if ('アソ' !~ /A/) { return $var1 } else { return $var0 }
END
    print qq{ok - 12 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 12 $^X @{[__FILE__]}\n};
}

__END__
