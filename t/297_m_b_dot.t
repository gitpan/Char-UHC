# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use strict;
use Char::UHC;
print "1..6\n";

my $__FILE__ = __FILE__;

if ('��' =~ /(.)/b) {
    if (length($1) == 1) {
        print qq{ok - 1 '��'=~/(.)/b; length(\$1)==1 $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 1 '��'=~/(.)/b; length(\$1)==1 $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 1 '��'=~/(.)/b; length(\$1)==1 $^X $__FILE__\n};
}

if (@_ = '��' =~ /(.)/bg) {
    if (scalar(@_) == length('��')) {
        if (grep( ! /^1$/, map { length($_) } @_)) {
            print qq{not ok - 2 \@_='��'=~/(.)/bg; grep(!/^1\$/,map{length(\$_)} \@_) $^X $__FILE__\n};
        }
        else {
            print qq{ok - 2 \@_='��'=~/(.)/bg; grep(!/^1\$/,map{length(\$_)} \@_) $^X $__FILE__\n};
        }
    }
    else {
        print qq{not ok - 2 \@_='��'=~/(.)/bg; grep(!/^1\$/,map{length(\$_)} \@_) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 2 \@_='��'=~/(.)/bg; grep(!/^1\$/,map{length(\$_)} \@_) $^X $__FILE__\n};
}

if ('��' =~ m/(.)/b) {
    if (length($1) == 1) {
        print qq{ok - 3 '��'=~m/(.)/b; length(\$1)==1 $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 3 '��'=~m/(.)/b; length(\$1)==1 $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 3 '��'=~m/(.)/b; length(\$1)==1 $^X $__FILE__\n};
}

if (@_ = '��' =~ m/(.)/bg) {
    if (scalar(@_) == length('��')) {
        if (grep( ! /^1$/, map { length($_) } @_)) {
            print qq{not ok - 4 \@_='��'=~m/(.)/bg; grep(!/^1\$/,map{length(\$_)} \@_) $^X $__FILE__\n};
        }
        else {
            print qq{ok - 4 \@_='��'=~m/(.)/bg; grep(!/^1\$/,map{length(\$_)} \@_) $^X $__FILE__\n};
        }
    }
    else {
        print qq{not ok - 4 \@_='��'=~m/(.)/bg; grep(!/^1\$/,map{length(\$_)} \@_) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 4 \@_='��'=~m/(.)/bg; grep(!/^1\$/,map{length(\$_)} \@_) $^X $__FILE__\n};
}

if ('��' =~ m'(.)'b) {
    if (length($1) == 1) {
        print qq{ok - 5 '��'=~m'(.)'b; length(\$1)==1 $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 5 '��'=~m'(.)'b; length(\$1)==1 $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 5 '��'=~m'(.)'b; length(\$1)==1 $^X $__FILE__\n};
}

if (@_ = '��' =~ m'(.)'bg) {
    if (scalar(@_) == length('��')) {
        if (grep( ! /^1$/, map { length($_) } @_)) {
            print qq{not ok - 6 \@_='��'=~m'(.)'bg; grep(!/^1\$/,map{length(\$_)} \@_) $^X $__FILE__\n};
        }
        else {
            print qq{ok - 6 \@_='��'=~m'(.)'bg; grep(!/^1\$/,map{length(\$_)} \@_) $^X $__FILE__\n};
        }
    }
    else {
        print qq{not ok - 6 \@_='��'=~m'(.)'bg; grep(!/^1\$/,map{length(\$_)} \@_) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 6 \@_='��'=~m'(.)'bg; grep(!/^1\$/,map{length(\$_)} \@_) $^X $__FILE__\n};
}

__END__

