package Char::Euhc;
######################################################################
#
# Char::Euhc - Run-time routines for Char/UHC.pm
#
# Copyright (c) 2008, 2009, 2010, 2011, 2012, 2013 INABA Hitoshi <ina@cpan.org>
#
######################################################################

use 5.00503;

BEGIN {
    if ($^X =~ / jperl /oxmsi) {
        die __FILE__, ": needs perl(not jperl) 5.00503 or later. (\$^X==$^X)";
    }
    if (CORE::ord('A') == 193) {
        die __FILE__, ": is not US-ASCII script (may be EBCDIC or EBCDIK script).";
    }
    if (CORE::ord('A') != 0x41) {
        die __FILE__, ": is not US-ASCII script (must be US-ASCII script).";
    }
}

# 12.3. Delaying use Until Runtime
# in Chapter 12. Packages, Libraries, and Modules
# of ISBN 0-596-00313-7 Perl Cookbook, 2nd Edition.
# (and so on)

BEGIN { eval q{ use vars qw($VERSION) } }
$VERSION = sprintf '%d.%02d', q$Revision: 0.86 $ =~ /(\d+)/xmsg;

BEGIN {
    my $PERL5LIB = __FILE__;

    # DOS-like system
    if ($^O =~ /\A (?: MSWin32 | NetWare | symbian | dos ) \z/oxms) {
        $PERL5LIB =~ s{[^\x81-\xFE/]*$}{Char::UHC};
    }

    # UNIX-like system
    else {
        $PERL5LIB =~ s{[^\x81-\xFE/]*$}{Char::UHC};
    }

    my @inc = ();
    my %inc = ();
    for my $path ($PERL5LIB, @INC) {
        if (not exists $inc{$path}) {
            push @inc, $path;
            $inc{$path} = 1;
        }
    }
    @INC = @inc;
}

BEGIN {

    # instead of utf8.pm
    eval q{
        no warnings qw(redefine);
        *utf8::upgrade   = sub { CORE::length $_[0] };
        *utf8::downgrade = sub { 1 };
        *utf8::encode    = sub {   };
        *utf8::decode    = sub { 1 };
        *utf8::is_utf8   = sub {   };
        *utf8::valid     = sub { 1 };
    };
    if ($@) {
        *utf8::upgrade   = sub { CORE::length $_[0] };
        *utf8::downgrade = sub { 1 };
        *utf8::encode    = sub {   };
        *utf8::decode    = sub { 1 };
        *utf8::is_utf8   = sub {   };
        *utf8::valid     = sub { 1 };
    }
}

# poor Symbol.pm - substitute of real Symbol.pm
BEGIN {
    my $genpkg = "Symbol::";
    my $genseq = 0;

    sub gensym () {
        my $name = "GEN" . $genseq++;

        # here, no strict qw(refs); if strict.pm exists

        my $ref = \*{$genpkg . $name};
        delete $$genpkg{$name};
        return $ref;
    }

    sub qualify ($;$) {
        my ($name) = @_;
        if (!ref($name) && (Char::Euhc::index($name, '::') == -1) && (Char::Euhc::index($name, "'") == -1)) {
            my $pkg;
            my %global = map {$_ => 1} qw(ARGV ARGVOUT ENV INC SIG STDERR STDIN STDOUT DATA);

            # Global names: special character, "^xyz", or other.
            if ($name =~ /^(([^\x81-\xFEa-z])|(\^[a-z_]+))\z/i || $global{$name}) {
                # RGS 2001-11-05 : translate leading ^X to control-char
                $name =~ s/^\^([a-z_])/'qq(\c'.$1.')'/eei;
                $pkg = "main";
            }
            else {
                $pkg = (@_ > 1) ? $_[1] : caller;
            }
            $name = $pkg . "::" . $name;
        }
        return $name;
    }

    sub qualify_to_ref ($;$) {

        # here, no strict qw(refs); if strict.pm exists

        return \*{ qualify $_[0], @_ > 1 ? $_[1] : caller };
    }
}

# Column: local $@
# in Chapter 9. Osaete okitai Perl no kiso
# of ISBN 10: 4798119172 | ISBN 13: 978-4798119175 MODAN Perl NYUMON
# (and so on)

# use strict; if strict.pm exists
BEGIN {
    if (eval { local $@; CORE::require strict }) {
        strict::->import;
    }
}

# P.714 29.2.39. flock
# in Chapter 29: Functions
# of ISBN 0-596-00027-8 Programming Perl Third Edition.

# P.863 flock
# in Chapter 27: Functions
# of ISBN 978-0-596-00492-7 Programming Perl 4th Edition.

sub LOCK_SH() {1}
sub LOCK_EX() {2}
sub LOCK_UN() {8}
sub LOCK_NB() {4}

# instead of Carp.pm
sub carp;
sub croak;
sub cluck;
sub confess;

my $your_char = q{[\x81-\xFE][\x00-\xFF]|[\x00-\xFF]};

# regexp of character
my $q_char = qr/$your_char/oxms;

#
# UHC character range per length
#
my %range_tr = ();

#
# alias of encoding name
#
BEGIN { eval q{ use vars qw($encoding_alias) } }

#
# UHC case conversion
#
my %lc = ();
@lc{qw(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)} =
    qw(a b c d e f g h i j k l m n o p q r s t u v w x y z);
my %uc = ();
@uc{qw(a b c d e f g h i j k l m n o p q r s t u v w x y z)} =
    qw(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z);
my %fc = ();
@fc{qw(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)} =
    qw(a b c d e f g h i j k l m n o p q r s t u v w x y z);

if (0) {
}

elsif (__PACKAGE__ =~ / \b Euhc \z/oxms) {
    %range_tr = (
        1 => [ [0x00..0x80],
               [0xFF..0xFF],
             ],
        2 => [ [0x81..0xFE],[0x41..0x5A],
               [0x81..0xFE],[0x61..0x7A],
               [0x81..0xFE],[0x81..0xFE],
             ],
    );
    $encoding_alias = qr/ \b (?: euc.*kr | kr.*euc | (?:x-)?uhc | (?:x-)?windows-949 | ks_c_5601-1987 | cp949 ) \b /oxmsi;
}

else {
    croak "Don't know my package name '@{[__PACKAGE__]}'";
}

#
# @ARGV wildcard globbing
#
sub import {

    if ($^O =~ /\A (?: MSWin32 | NetWare | symbian | dos ) \z/oxms) {
        my @argv = ();
        for (@ARGV) {

            # has space
            if (/\A (?:$q_char)*? [ ] /oxms) {
                if (my @glob = Char::Euhc::glob(qq{"$_"})) {
                    push @argv, @glob;
                }
                else {
                    push @argv, $_;
                }
            }

            # has wildcard metachar
            elsif (/\A (?:$q_char)*? [*?] /oxms) {
                if (my @glob = Char::Euhc::glob($_)) {
                    push @argv, @glob;
                }
                else {
                    push @argv, $_;
                }
            }

            # no wildcard globbing
            else {
                push @argv, $_;
            }
        }
        @ARGV = @argv;
    }
}

# P.230 Care with Prototypes
# in Chapter 6: Subroutines
# of ISBN 0-596-00027-8 Programming Perl Third Edition.
#
# If you aren't careful, you can get yourself into trouble with prototypes.
# But if you are careful, you can do a lot of neat things with them. This is
# all very powerful, of course, and should only be used in moderation to make
# the world a better place.

# P.332 Care with Prototypes
# in Chapter 7: Subroutines
# of ISBN 978-0-596-00492-7 Programming Perl 4th Edition.
#
# If you aren't careful, you can get yourself into trouble with prototypes.
# But if you are careful, you can do a lot of neat things with them. This is
# all very powerful, of course, and should only be used in moderation to make
# the world a better place.

#
# Prototypes of subroutines
#
sub unimport {}
sub Char::Euhc::split(;$$$);
sub Char::Euhc::tr($$$$;$);
sub Char::Euhc::chop(@);
sub Char::Euhc::index($$;$);
sub Char::Euhc::rindex($$;$);
sub Char::Euhc::lcfirst(@);
sub Char::Euhc::lcfirst_();
sub Char::Euhc::lc(@);
sub Char::Euhc::lc_();
sub Char::Euhc::ucfirst(@);
sub Char::Euhc::ucfirst_();
sub Char::Euhc::uc(@);
sub Char::Euhc::uc_();
sub Char::Euhc::fc(@);
sub Char::Euhc::fc_();
sub Char::Euhc::ignorecase;
sub Char::Euhc::classic_character_class;
sub Char::Euhc::capture;
sub Char::Euhc::chr(;$);
sub Char::Euhc::chr_();
sub Char::Euhc::filetest;
sub Char::Euhc::r(;*@);
sub Char::Euhc::w(;*@);
sub Char::Euhc::x(;*@);
sub Char::Euhc::o(;*@);
sub Char::Euhc::R(;*@);
sub Char::Euhc::W(;*@);
sub Char::Euhc::X(;*@);
sub Char::Euhc::O(;*@);
sub Char::Euhc::e(;*@);
sub Char::Euhc::z(;*@);
sub Char::Euhc::s(;*@);
sub Char::Euhc::f(;*@);
sub Char::Euhc::d(;*@);
sub Char::Euhc::l(;*@);
sub Char::Euhc::p(;*@);
sub Char::Euhc::S(;*@);
sub Char::Euhc::b(;*@);
sub Char::Euhc::c(;*@);
sub Char::Euhc::u(;*@);
sub Char::Euhc::g(;*@);
sub Char::Euhc::k(;*@);
sub Char::Euhc::T(;*@);
sub Char::Euhc::B(;*@);
sub Char::Euhc::M(;*@);
sub Char::Euhc::A(;*@);
sub Char::Euhc::C(;*@);
sub Char::Euhc::filetest_;
sub Char::Euhc::r_();
sub Char::Euhc::w_();
sub Char::Euhc::x_();
sub Char::Euhc::o_();
sub Char::Euhc::R_();
sub Char::Euhc::W_();
sub Char::Euhc::X_();
sub Char::Euhc::O_();
sub Char::Euhc::e_();
sub Char::Euhc::z_();
sub Char::Euhc::s_();
sub Char::Euhc::f_();
sub Char::Euhc::d_();
sub Char::Euhc::l_();
sub Char::Euhc::p_();
sub Char::Euhc::S_();
sub Char::Euhc::b_();
sub Char::Euhc::c_();
sub Char::Euhc::u_();
sub Char::Euhc::g_();
sub Char::Euhc::k_();
sub Char::Euhc::T_();
sub Char::Euhc::B_();
sub Char::Euhc::M_();
sub Char::Euhc::A_();
sub Char::Euhc::C_();
sub Char::Euhc::glob($);
sub Char::Euhc::glob_();
sub Char::Euhc::lstat(*);
sub Char::Euhc::lstat_();
sub Char::Euhc::opendir(*$);
sub Char::Euhc::stat(*);
sub Char::Euhc::stat_();
sub Char::Euhc::unlink(@);
sub Char::Euhc::chdir(;$);
sub Char::Euhc::do($);
sub Char::Euhc::require(;$);
sub Char::Euhc::telldir(*);

sub Char::UHC::ord(;$);
sub Char::UHC::ord_();
sub Char::UHC::reverse(@);
sub Char::UHC::getc(;*@);
sub Char::UHC::length(;$);
sub Char::UHC::substr($$;$$);
sub Char::UHC::index($$;$);
sub Char::UHC::rindex($$;$);

#
# Character class
#
BEGIN { eval q{ use vars qw(
    $anchor
    $dot
    $dot_s
    $eD
    $eS
    $eW
    $eH
    $eV
    $eR
    $eN
    $not_alnum
    $not_alpha
    $not_ascii
    $not_blank
    $not_cntrl
    $not_digit
    $not_graph
    $not_lower
    $not_lower_i
    $not_print
    $not_punct
    $not_space
    $not_upper
    $not_upper_i
    $not_word
    $not_xdigit
    $eb
    $eB
    $matched
) } }
${Char::Euhc::anchor}      = qr{\G(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE])*?};
${Char::Euhc::dot}         = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE\x0A])};
${Char::Euhc::dot_s}       = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE])};
${Char::Euhc::eD}          = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE0-9])};

${Char::Euhc::eS}          = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE\x09\x0A\x0C\x0D\x20])};

# Incompatible Changes
# \s in regular expressions now matches a Vertical Tab (experimental)
# http://search.cpan.org/~zefram/perl-5.17.0/pod/perldelta.pod

# ${Char::Euhc::eS}        = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE\x09\x0A\x0B\x0C\x0D\x20])};

${Char::Euhc::eW}          = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE0-9A-Z_a-z])};
${Char::Euhc::eH}          = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE\x09\x20])};
${Char::Euhc::eV}          = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE\x0A\x0B\x0C\x0D])};
${Char::Euhc::eR}          = qr{(?:\x0D\x0A|[\x0A\x0D])};
${Char::Euhc::eN}          = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE\x0A])};
${Char::Euhc::not_alnum}   = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE\x30-\x39\x41-\x5A\x61-\x7A])};
${Char::Euhc::not_alpha}   = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE\x41-\x5A\x61-\x7A])};
${Char::Euhc::not_ascii}   = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE\x00-\x7F])};
${Char::Euhc::not_blank}   = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE\x09\x20])};
${Char::Euhc::not_cntrl}   = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE\x00-\x1F\x7F])};
${Char::Euhc::not_digit}   = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE\x30-\x39])};
${Char::Euhc::not_graph}   = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE\x21-\x7F])};
${Char::Euhc::not_lower}   = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE\x61-\x7A])};
${Char::Euhc::not_lower_i} = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE])};
${Char::Euhc::not_print}   = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE\x20-\x7F])};
${Char::Euhc::not_punct}   = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE\x21-\x2F\x3A-\x3F\x40\x5B-\x5F\x60\x7B-\x7E])};
${Char::Euhc::not_space}   = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE\x09\x0A\x0B\x0C\x0D\x20])};
${Char::Euhc::not_upper}   = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE\x41-\x5A])};
${Char::Euhc::not_upper_i} = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE])};
${Char::Euhc::not_word}    = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE\x30-\x39\x41-\x5A\x5F\x61-\x7A])};
${Char::Euhc::not_xdigit}  = qr{(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE\x30-\x39\x41-\x46\x61-\x66])};
${Char::Euhc::eb}          = qr{(?:\A(?=[0-9A-Z_a-z])|(?<=[\x00-\x2F\x40\x5B-\x5E\x60\x7B-\xFF])(?=[0-9A-Z_a-z])|(?<=[0-9A-Z_a-z])(?=[\x00-\x2F\x40\x5B-\x5E\x60\x7B-\xFF]|\z))};
${Char::Euhc::eB}          = qr{(?:(?<=[0-9A-Z_a-z])(?=[0-9A-Z_a-z])|(?<=[\x00-\x2F\x40\x5B-\x5E\x60\x7B-\xFF])(?=[\x00-\x2F\x40\x5B-\x5E\x60\x7B-\xFF]))};

#
# UHC split
#
sub Char::Euhc::split(;$$$) {

    # P.794 29.2.161. split
    # in Chapter 29: Functions
    # of ISBN 0-596-00027-8 Programming Perl Third Edition.

    # P.951 split
    # in Chapter 27: Functions
    # of ISBN 978-0-596-00492-7 Programming Perl 4th Edition.

    my $pattern = $_[0];
    my $string  = $_[1];
    my $limit   = $_[2];

    # if $string is omitted, the function splits the $_ string
    if (not defined $string) {
        if (defined $_) {
            $string = $_;
        }
        else {
            $string = '';
        }
    }

    my @split = ();

    # when string is empty
    if ($string eq '') {

        # resulting list value in list context
        if (wantarray) {
            return @split;
        }

        # count of substrings in scalar context
        else {
            carp "Use of implicit split to \@_ is deprecated" if $^W;
            @_ = @split;
            return scalar @_;
        }
    }

    # if $limit is negative, it is treated as if an arbitrarily large $limit has been specified
    if ((not defined $limit) or ($limit <= 0)) {

        # if $pattern is also omitted or is the literal space, " ", the function splits
        # on whitespace, /\s+/, after skipping any leading whitespace
        # (and so on)

        if ((not defined $pattern) or ($pattern eq ' ')) {
            $string =~ s/ \A \s+ //oxms;

            # P.1024 Appendix W.10 Multibyte Processing
            # of ISBN 1-56592-224-7 CJKV Information Processing
            # (and so on)

            # the //m modifier is assumed when you split on the pattern /^/
            # (and so on)

            while ($string =~ s/\A((?:$q_char)*?)\s+//m) {

                # if the $pattern contains parentheses, then the substring matched by each pair of parentheses
                # is included in the resulting list, interspersed with the fields that are ordinarily returned
                # (and so on)

                local $@;
                for (my $digit=1; $digit <= 1; $digit++) {
                    push @split, eval('$' . $digit);
                }
            }
        }

        # a pattern capable of matching either the null string or something longer than the
        # null string will split the value of $string into separate characters wherever it
        # matches the null string between characters
        # (and so on)

        elsif ('' =~ / \A $pattern \z /xms) {
            my $last_subexpression_offsets = _last_subexpression_offsets($pattern);
            while ($string =~ s/\A((?:$q_char)+?)$pattern//m) {
                local $@;
                for (my $digit=1; $digit <= ($last_subexpression_offsets + 1); $digit++) {
                    push @split, eval('$' . $digit);
                }
            }
        }

        else {
            my $last_subexpression_offsets = _last_subexpression_offsets($pattern);
            while ($string =~ s/\A((?:$q_char)*?)$pattern//m) {
                local $@;
                for (my $digit=1; $digit <= ($last_subexpression_offsets + 1); $digit++) {
                    push @split, eval('$' . $digit);
                }
            }
        }
    }

    else {
        if ((not defined $pattern) or ($pattern eq ' ')) {
            $string =~ s/ \A \s+ //oxms;
            while ((--$limit > 0) and (CORE::length($string) > 0)) {
                if ($string =~ s/\A((?:$q_char)*?)\s+//m) {
                    local $@;
                    for (my $digit=1; $digit <= 1; $digit++) {
                        push @split, eval('$' . $digit);
                    }
                }
            }
        }
        elsif ('' =~ / \A $pattern \z /xms) {
            my $last_subexpression_offsets = _last_subexpression_offsets($pattern);
            while ((--$limit > 0) and (CORE::length($string) > 0)) {
                if ($string =~ s/\A((?:$q_char)+?)$pattern//m) {
                    local $@;
                    for (my $digit=1; $digit <= ($last_subexpression_offsets + 1); $digit++) {
                        push @split, eval('$' . $digit);
                    }
                }
            }
        }
        else {
            my $last_subexpression_offsets = _last_subexpression_offsets($pattern);
            while ((--$limit > 0) and (CORE::length($string) > 0)) {
                if ($string =~ s/\A((?:$q_char)*?)$pattern//m) {
                    local $@;
                    for (my $digit=1; $digit <= ($last_subexpression_offsets + 1); $digit++) {
                        push @split, eval('$' . $digit);
                    }
                }
            }
        }
    }

    push @split, $string;

    # if $limit is omitted or zero, trailing null fields are stripped from the result
    if ((not defined $limit) or ($limit == 0)) {
        while ((scalar(@split) >= 1) and ($split[-1] eq '')) {
            pop @split;
        }
    }

    # resulting list value in list context
    if (wantarray) {
        return @split;
    }

    # count of substrings in scalar context
    else {
        carp "Use of implicit split to \@_ is deprecated" if $^W;
        @_ = @split;
        return scalar @_;
    }
}

#
# get last subexpression offsets
#
sub _last_subexpression_offsets {
    my $pattern = $_[0];

    # remove comment
    $pattern =~ s/\(\?\# .*? \)//oxmsg;

    my $modifier = '';
    if ($pattern =~ /\(\?\^? ([\-A-Za-z]+) :/oxms) {
        $modifier = $1;
        $modifier =~ s/-[A-Za-z]*//;
    }

    # with /x modifier
    my @char = ();
    if ($modifier =~ /x/oxms) {
        @char = $pattern =~ /\G(
            \\ (?:$q_char)                  |
            \# (?:$q_char)*? $              |
            \[ (?: \\\] | (?:$q_char))+? \] |
            \(\?                            |
            (?:$q_char)
        )/oxmsg;
    }

    # without /x modifier
    else {
        @char = $pattern =~ /\G(
            \\ (?:$q_char)                  |
            \[ (?: \\\] | (?:$q_char))+? \] |
            \(\?                            |
            (?:$q_char)
        )/oxmsg;
    }

    return scalar grep { $_ eq '(' } @char;
}

#
# UHC transliteration (tr///)
#
sub Char::Euhc::tr($$$$;$) {

    my $bind_operator   = $_[1];
    my $searchlist      = $_[2];
    my $replacementlist = $_[3];
    my $modifier        = $_[4] || '';

    if ($modifier =~ /r/oxms) {
        if ($bind_operator =~ / !~ /oxms) {
            croak "Using !~ with tr///r doesn't make sense";
        }
    }

    my @char            = $_[0] =~ /\G ($q_char) /oxmsg;
    my @searchlist      = _charlist_tr($searchlist);
    my @replacementlist = _charlist_tr($replacementlist);

    my %tr = ();
    for (my $i=0; $i <= $#searchlist; $i++) {
        if (not exists $tr{$searchlist[$i]}) {
            if (defined $replacementlist[$i] and ($replacementlist[$i] ne '')) {
                $tr{$searchlist[$i]} = $replacementlist[$i];
            }
            elsif ($modifier =~ /d/oxms) {
                $tr{$searchlist[$i]} = '';
            }
            elsif (defined $replacementlist[-1] and ($replacementlist[-1] ne '')) {
                $tr{$searchlist[$i]} = $replacementlist[-1];
            }
            else {
                $tr{$searchlist[$i]} = $searchlist[$i];
            }
        }
    }

    my $tr = 0;
    my $replaced = '';
    if ($modifier =~ /c/oxms) {
        while (defined(my $char = shift @char)) {
            if (not exists $tr{$char}) {
                if (defined $replacementlist[0]) {
                    $replaced .= $replacementlist[0];
                }
                $tr++;
                if ($modifier =~ /s/oxms) {
                    while (@char and (not exists $tr{$char[0]})) {
                        shift @char;
                        $tr++;
                    }
                }
            }
            else {
                $replaced .= $char;
            }
        }
    }
    else {
        while (defined(my $char = shift @char)) {
            if (exists $tr{$char}) {
                $replaced .= $tr{$char};
                $tr++;
                if ($modifier =~ /s/oxms) {
                    while (@char and (exists $tr{$char[0]}) and ($tr{$char[0]} eq $tr{$char})) {
                        shift @char;
                        $tr++;
                    }
                }
            }
            else {
                $replaced .= $char;
            }
        }
    }

    if ($modifier =~ /r/oxms) {
        return $replaced;
    }
    else {
        $_[0] = $replaced;
        if ($bind_operator =~ / !~ /oxms) {
            return not $tr;
        }
        else {
            return $tr;
        }
    }
}

#
# UHC chop
#
sub Char::Euhc::chop(@) {

    my $chop;
    if (@_ == 0) {
        my @char = /\G ($q_char) /oxmsg;
        $chop = pop @char;
        $_ = join '', @char;
    }
    else {
        for (@_) {
            my @char = /\G ($q_char) /oxmsg;
            $chop = pop @char;
            $_ = join '', @char;
        }
    }
    return $chop;
}

#
# UHC index by octet
#
sub Char::Euhc::index($$;$) {

    my($str,$substr,$position) = @_;
    $position ||= 0;
    my $pos = 0;

    while ($pos < CORE::length($str)) {
        if (CORE::substr($str,$pos,CORE::length($substr)) eq $substr) {
            if ($pos >= $position) {
                return $pos;
            }
        }
        if (CORE::substr($str,$pos) =~ /\A ($q_char) /oxms) {
            $pos += CORE::length($1);
        }
        else {
            $pos += 1;
        }
    }
    return -1;
}

#
# UHC reverse index
#
sub Char::Euhc::rindex($$;$) {

    my($str,$substr,$position) = @_;
    $position ||= CORE::length($str) - 1;
    my $pos = 0;
    my $rindex = -1;

    while (($pos < CORE::length($str)) and ($pos <= $position)) {
        if (CORE::substr($str,$pos,CORE::length($substr)) eq $substr) {
            $rindex = $pos;
        }
        if (CORE::substr($str,$pos) =~ /\A ($q_char) /oxms) {
            $pos += CORE::length($1);
        }
        else {
            $pos += 1;
        }
    }
    return $rindex;
}

#
# UHC lower case first with parameter
#
sub Char::Euhc::lcfirst(@) {
    if (@_) {
        my $s = shift @_;
        if (@_ and wantarray) {
            return Char::Euhc::lc(CORE::substr($s,0,1)) . CORE::substr($s,1), @_;
        }
        else {
            return Char::Euhc::lc(CORE::substr($s,0,1)) . CORE::substr($s,1);
        }
    }
    else {
        return Char::Euhc::lc(CORE::substr($_,0,1)) . CORE::substr($_,1);
    }
}

#
# UHC lower case first without parameter
#
sub Char::Euhc::lcfirst_() {
    return Char::Euhc::lc(CORE::substr($_,0,1)) . CORE::substr($_,1);
}

#
# UHC lower case with parameter
#
sub Char::Euhc::lc(@) {
    if (@_) {
        my $s = shift @_;
        if (@_ and wantarray) {
            return join('', map {defined($lc{$_}) ? $lc{$_} : $_} ($s =~ /\G ($q_char) /oxmsg)), @_;
        }
        else {
            return join('', map {defined($lc{$_}) ? $lc{$_} : $_} ($s =~ /\G ($q_char) /oxmsg));
        }
    }
    else {
        return Char::Euhc::lc_();
    }
}

#
# UHC lower case without parameter
#
sub Char::Euhc::lc_() {
    my $s = $_;
    return join '', map {defined($lc{$_}) ? $lc{$_} : $_} ($s =~ /\G ($q_char) /oxmsg);
}

#
# UHC upper case first with parameter
#
sub Char::Euhc::ucfirst(@) {
    if (@_) {
        my $s = shift @_;
        if (@_ and wantarray) {
            return Char::Euhc::uc(CORE::substr($s,0,1)) . CORE::substr($s,1), @_;
        }
        else {
            return Char::Euhc::uc(CORE::substr($s,0,1)) . CORE::substr($s,1);
        }
    }
    else {
        return Char::Euhc::uc(CORE::substr($_,0,1)) . CORE::substr($_,1);
    }
}

#
# UHC upper case first without parameter
#
sub Char::Euhc::ucfirst_() {
    return Char::Euhc::uc(CORE::substr($_,0,1)) . CORE::substr($_,1);
}

#
# UHC upper case with parameter
#
sub Char::Euhc::uc(@) {
    if (@_) {
        my $s = shift @_;
        if (@_ and wantarray) {
            return join('', map {defined($uc{$_}) ? $uc{$_} : $_} ($s =~ /\G ($q_char) /oxmsg)), @_;
        }
        else {
            return join('', map {defined($uc{$_}) ? $uc{$_} : $_} ($s =~ /\G ($q_char) /oxmsg));
        }
    }
    else {
        return Char::Euhc::uc_();
    }
}

#
# UHC upper case without parameter
#
sub Char::Euhc::uc_() {
    my $s = $_;
    return join '', map {defined($uc{$_}) ? $uc{$_} : $_} ($s =~ /\G ($q_char) /oxmsg);
}

#
# UHC fold case with parameter
#
sub Char::Euhc::fc(@) {
    if (@_) {
        my $s = shift @_;
        if (@_ and wantarray) {
            return join('', map {defined($fc{$_}) ? $fc{$_} : $_} ($s =~ /\G ($q_char) /oxmsg)), @_;
        }
        else {
            return join('', map {defined($fc{$_}) ? $fc{$_} : $_} ($s =~ /\G ($q_char) /oxmsg));
        }
    }
    else {
        return Char::Euhc::fc_();
    }
}

#
# UHC fold case without parameter
#
sub Char::Euhc::fc_() {
    my $s = $_;
    return join '', map {defined($fc{$_}) ? $fc{$_} : $_} ($s =~ /\G ($q_char) /oxmsg);
}

#
# UHC regexp capture
#
{
    # 10.3. Creating Persistent Private Variables
    # in Chapter 10. Subroutines
    # of ISBN 0-596-00313-7 Perl Cookbook, 2nd Edition.

    my $last_s_matched = 0;

    sub Char::Euhc::capture {
        if ($last_s_matched and ($_[0] =~ /\A [1-9][0-9]* \z/oxms)) {
            return $_[0] + 1;
        }
        return $_[0];
    }

    # UHC mark last regexp matched
    sub Char::Euhc::matched() {
        $last_s_matched = 0;
    }

    # UHC mark last s/// matched
    sub Char::Euhc::s_matched() {
        $last_s_matched = 1;
    }

    # P.854 31.17. use re
    # in Chapter 31. Pragmatic Modules
    # of ISBN 0-596-00027-8 Programming Perl Third Edition.

    # P.1026 re
    # in Chapter 29. Pragmatic Modules
    # of ISBN 978-0-596-00492-7 Programming Perl 4th Edition.

    $Char::Euhc::matched = qr/(?{Char::Euhc::matched})/;
}

#
# UHC regexp ignore case modifier
#
sub Char::Euhc::ignorecase {

    my @string = @_;
    my $metachar = qr/[\@\\|[\]{]/oxms;

    # ignore case of $scalar or @array
    for my $string (@string) {

        # split regexp
        my @char = $string =~ /\G(
            \[\^ |
                \\? (?:$q_char)
        )/oxmsg;

        # unescape character
        for (my $i=0; $i <= $#char; $i++) {
            next if not defined $char[$i];

            # open character class [...]
            if ($char[$i] eq '[') {
                my $left = $i;

                # [] make die "unmatched [] in regexp ..."

                if ($char[$i+1] eq ']') {
                    $i++;
                }

                while (1) {
                    if (++$i > $#char) {
                        croak "Unmatched [] in regexp";
                    }
                    if ($char[$i] eq ']') {
                        my $right = $i;
                        my @charlist = charlist_qr(@char[$left+1..$right-1], 'i');

                        # escape character
                        for my $char (@charlist) {
                            if (0) {
                            }

                            # do not use quotemeta here
                            elsif ($char =~ /\A ([\x80-\xFF].*) ($metachar) \z/oxms) {
                                $char = $1 . '\\' . $2;
                            }
                            elsif ($char =~ /\A [.|)] \z/oxms) {
                                $char = $1 . '\\' . $char;
                            }
                        }

                        # [...]
                        splice @char, $left, $right-$left+1, '(?:' . join('|', @charlist) . ')';

                        $i = $left;
                        last;
                    }
                }
            }

            # open character class [^...]
            elsif ($char[$i] eq '[^') {
                my $left = $i;

                # [^] make die "unmatched [] in regexp ..."

                if ($char[$i+1] eq ']') {
                    $i++;
                }

                while (1) {
                    if (++$i > $#char) {
                        croak "Unmatched [] in regexp";
                    }
                    if ($char[$i] eq ']') {
                        my $right = $i;
                        my @charlist = charlist_not_qr(@char[$left+1..$right-1], 'i');

                        # escape character
                        for my $char (@charlist) {
                            if (0) {
                            }

                            # do not use quotemeta here
                            elsif ($char =~ /\A ([\x80-\xFF].*) ($metachar) \z/oxms) {
                                $char = $1 . '\\' . $2;
                            }
                            elsif ($char =~ /\A [.|)] \z/oxms) {
                                $char = '\\' . $char;
                            }
                        }

                        # [^...]
                        splice @char, $left, $right-$left+1, '(?!' . join('|', @charlist) . ")(?:$your_char)";

                        $i = $left;
                        last;
                    }
                }
            }

            # rewrite classic character class or escape character
            elsif (my $char = classic_character_class($char[$i])) {
                $char[$i] = $char;
            }

            # with /i modifier
            elsif ($char[$i] =~ /\A [\x00-\xFF] \z/oxms) {
                my $uc = Char::Euhc::uc($char[$i]);
                my $fc = Char::Euhc::fc($char[$i]);
                if ($uc ne $fc) {
                    if (CORE::length($fc) == 1) {
                        $char[$i] = '['   . $uc       . $fc . ']';
                    }
                    else {
                        $char[$i] = '(?:' . $uc . '|' . $fc . ')';
                    }
                }
            }
        }

        # characterize
        for (my $i=0; $i <= $#char; $i++) {
            next if not defined $char[$i];

            if (0) {
            }

            # escape last octet of multiple-octet
            elsif ($char[$i] =~ /\A ([\x80-\xFF].*) ($metachar) \z/oxms) {
                $char[$i] = $1 . '\\' . $2;
            }

            # quote character before ? + * {
            elsif (($i >= 1) and ($char[$i] =~ /\A [\?\+\*\{] \z/oxms)) {
                if ($char[$i-1] !~ /\A [\x00-\xFF] \z/oxms) {
                    $char[$i-1] = '(?:' . $char[$i-1] . ')';
                }
            }
        }

        $string = join '', @char;
    }

    # make regexp string
    return @string;
}

#
# classic character class ( \D \S \W \d \s \w \C \X \H \V \h \v \R \N \b \B )
#
sub Char::Euhc::classic_character_class {
    my($char) = @_;

    return {
        '\D' => '${Char::Euhc::eD}',
        '\S' => '${Char::Euhc::eS}',
        '\W' => '${Char::Euhc::eW}',
        '\d' => '[0-9]',

        # Before Perl 5.6, \s only matched the five whitespace characters
        # tab, newline, form-feed, carriage return, and the space character
        # itself, which, taken together, is the character class [\t\n\f\r ].
        # We can still use the ASCII whitespace semantics using this
        # software.

                 # \t  \n  \f  \r space
        '\s' => '[\x09\x0A\x0C\x0D\x20]',

        # Incompatible Changes
        # \s in regular expressions now matches a Vertical Tab (experimental)
        # http://search.cpan.org/~zefram/perl-5.17.0/pod/perldelta.pod

        # '\s' => '[\x09\x0A\x0B\x0C\x0D\x20]',

        '\w' => '[0-9A-Z_a-z]',
        '\C' => '[\x00-\xFF]',
        '\X' => 'X',

        # \h \v \H \V

        # P.114 Character Class Shortcuts
        # in Chapter 7: In the World of Regular Expressions
        # of ISBN 978-0-596-52010-6 Learning Perl, Fifth Edition

        # P.357 13.2.3 Whitespace
        # in Chapter 13: perlrecharclass: Perl Regular Expression Character Classes
        # of ISBN-13: 978-1-906966-02-7 The Perl Language Reference Manual (for Perl version 5.12.1)
        #
        # 0x00009   CHARACTER TABULATION  h s
        # 0x0000a         LINE FEED (LF)   vs
        # 0x0000b        LINE TABULATION   v
        # 0x0000c         FORM FEED (FF)   vs
        # 0x0000d   CARRIAGE RETURN (CR)   vs
        # 0x00020                  SPACE  h s

        # P.196 Table 5-9. Alphanumeric regex metasymbols
        # in Chapter 5. Pattern Matching
        # of ISBN 978-0-596-00492-7 Programming Perl 4th Edition.

        # (and so on)

        '\H' => '${Char::Euhc::eH}',
        '\V' => '${Char::Euhc::eV}',
        '\h' => '[\x09\x20]',
        '\v' => '[\x0A\x0B\x0C\x0D]',
        '\R' => '${Char::Euhc::eR}',

        # \N
        #
        # http://perldoc.perl.org/perlre.html
        # Character Classes and other Special Escapes
        # Any character but \n (experimental). Not affected by /s modifier

        '\N' => '${Char::Euhc::eN}',

        # \b \B

        # P.180 Boundaries: The \b and \B Assertions
        # in Chapter 5: Pattern Matching
        # of ISBN 0-596-00027-8 Programming Perl Third Edition.

        # P.219 Boundaries: The \b and \B Assertions
        # in Chapter 5: Pattern Matching
        # of ISBN 978-0-596-00492-7 Programming Perl 4th Edition.

        # '\b' => '(?:(?<=\A|\W)(?=\w)|(?<=\w)(?=\W|\z))',
        '\b' => '${Char::Euhc::eb}',

        # '\B' => '(?:(?<=\w)(?=\w)|(?<=\W)(?=\W))',
        '\B' => '${Char::Euhc::eB}',

    }->{$char} || '';
}

#
# prepare UHC characters per length
#

# 1 octet characters
my @chars1 = ();
sub chars1 {
    if (@chars1) {
        return @chars1;
    }
    if (exists $range_tr{1}) {
        my @ranges = @{ $range_tr{1} };
        while (my @range = splice(@ranges,0,1)) {
            for my $oct0 (@{$range[0]}) {
                push @chars1, pack 'C', $oct0;
            }
        }
    }
    return @chars1;
}

# 2 octets characters
my @chars2 = ();
sub chars2 {
    if (@chars2) {
        return @chars2;
    }
    if (exists $range_tr{2}) {
        my @ranges = @{ $range_tr{2} };
        while (my @range = splice(@ranges,0,2)) {
            for my $oct0 (@{$range[0]}) {
                for my $oct1 (@{$range[1]}) {
                    push @chars2, pack 'CC', $oct0,$oct1;
                }
            }
        }
    }
    return @chars2;
}

# 3 octets characters
my @chars3 = ();
sub chars3 {
    if (@chars3) {
        return @chars3;
    }
    if (exists $range_tr{3}) {
        my @ranges = @{ $range_tr{3} };
        while (my @range = splice(@ranges,0,3)) {
            for my $oct0 (@{$range[0]}) {
                for my $oct1 (@{$range[1]}) {
                    for my $oct2 (@{$range[2]}) {
                        push @chars3, pack 'CCC', $oct0,$oct1,$oct2;
                    }
                }
            }
        }
    }
    return @chars3;
}

# 4 octets characters
my @chars4 = ();
sub chars4 {
    if (@chars4) {
        return @chars4;
    }
    if (exists $range_tr{4}) {
        my @ranges = @{ $range_tr{4} };
        while (my @range = splice(@ranges,0,4)) {
            for my $oct0 (@{$range[0]}) {
                for my $oct1 (@{$range[1]}) {
                    for my $oct2 (@{$range[2]}) {
                        for my $oct3 (@{$range[3]}) {
                            push @chars4, pack 'CCCC', $oct0,$oct1,$oct2,$oct3;
                        }
                    }
                }
            }
        }
    }
    return @chars4;
}

#
# UHC open character list for tr
#
sub _charlist_tr {

    local $_ = shift @_;

    # unescape character
    my @char = ();
    while (not /\G \z/oxmsgc) {
        if (/\G (\\0?55|\\x2[Dd]|\\-) /oxmsgc) {
            push @char, '\-';
        }
        elsif (/\G \\ ([0-7]{2,3}) /oxmsgc) {
            push @char, CORE::chr(oct $1);
        }
        elsif (/\G \\x ([0-9A-Fa-f]{1,2}) /oxmsgc) {
            push @char, CORE::chr(hex $1);
        }
        elsif (/\G \\c ([\x40-\x5F]) /oxmsgc) {
            push @char, CORE::chr(CORE::ord($1) & 0x1F);
        }
        elsif (/\G (\\ [0nrtfbae]) /oxmsgc) {
            push @char, {
                '\0' => "\0",
                '\n' => "\n",
                '\r' => "\r",
                '\t' => "\t",
                '\f' => "\f",
                '\b' => "\x08", # \b means backspace in character class
                '\a' => "\a",
                '\e' => "\e",
            }->{$1};
        }
        elsif (/\G \\ ($q_char) /oxmsgc) {
            push @char, $1;
        }
        elsif (/\G ($q_char) /oxmsgc) {
            push @char, $1;
        }
    }

    # join separated multiple-octet
    @char = join('',@char) =~ /\G (\\-|$q_char) /oxmsg;

    # unescape '-'
    my @i = ();
    for my $i (0 .. $#char) {
        if ($char[$i] eq '\-') {
            $char[$i] = '-';
        }
        elsif ($char[$i] eq '-') {
            if ((0 < $i) and ($i < $#char)) {
                push @i, $i;
            }
        }
    }

    # open character list (reverse for splice)
    for my $i (CORE::reverse @i) {
        my @range = ();

        # range error
        if ((CORE::length($char[$i-1]) > CORE::length($char[$i+1])) or ($char[$i-1] gt $char[$i+1])) {
            croak "Invalid tr/// range \"\\x" . unpack('H*',$char[$i-1]) . '-\x' . unpack('H*',$char[$i+1]) . '"';
        }

        # range of multiple-octet code
        if (CORE::length($char[$i-1]) == 1) {
            if (CORE::length($char[$i+1]) == 1) {
                push @range, grep {($char[$i-1] le $_) and ($_ le $char[$i+1])} chars1();
            }
            elsif (CORE::length($char[$i+1]) == 2) {
                push @range, grep {$char[$i-1] le $_}                           chars1();
                push @range, grep {$_ le $char[$i+1]}                           chars2();
            }
            elsif (CORE::length($char[$i+1]) == 3) {
                push @range, grep {$char[$i-1] le $_}                           chars1();
                push @range,                                                    chars2();
                push @range, grep {$_ le $char[$i+1]}                           chars3();
            }
            elsif (CORE::length($char[$i+1]) == 4) {
                push @range, grep {$char[$i-1] le $_}                           chars1();
                push @range,                                                    chars2();
                push @range,                                                    chars3();
                push @range, grep {$_ le $char[$i+1]}                           chars4();
            }
            else {
                croak "Invalid tr/// range (over 4octets) \"\\x" . unpack('H*',$char[$i-1]) . '-\x' . unpack('H*',$char[$i+1]) . '"';
            }
        }
        elsif (CORE::length($char[$i-1]) == 2) {
            if (CORE::length($char[$i+1]) == 2) {
                push @range, grep {($char[$i-1] le $_) and ($_ le $char[$i+1])} chars2();
            }
            elsif (CORE::length($char[$i+1]) == 3) {
                push @range, grep {$char[$i-1] le $_}                           chars2();
                push @range, grep {$_ le $char[$i+1]}                           chars3();
            }
            elsif (CORE::length($char[$i+1]) == 4) {
                push @range, grep {$char[$i-1] le $_}                           chars2();
                push @range,                                                    chars3();
                push @range, grep {$_ le $char[$i+1]}                           chars4();
            }
            else {
                croak "Invalid tr/// range (over 4octets) \"\\x" . unpack('H*',$char[$i-1]) . '-\x' . unpack('H*',$char[$i+1]) . '"';
            }
        }
        elsif (CORE::length($char[$i-1]) == 3) {
            if (CORE::length($char[$i+1]) == 3) {
                push @range, grep {($char[$i-1] le $_) and ($_ le $char[$i+1])} chars3();
            }
            elsif (CORE::length($char[$i+1]) == 4) {
                push @range, grep {$char[$i-1] le $_}                           chars3();
                push @range, grep {$_ le $char[$i+1]}                           chars4();
            }
            else {
                croak "Invalid tr/// range (over 4octets) \"\\x" . unpack('H*',$char[$i-1]) . '-\x' . unpack('H*',$char[$i+1]) . '"';
            }
        }
        elsif (CORE::length($char[$i-1]) == 4) {
            if (CORE::length($char[$i+1]) == 4) {
                push @range, grep {($char[$i-1] le $_) and ($_ le $char[$i+1])} chars4();
            }
            else {
                croak "Invalid tr/// range (over 4octets) \"\\x" . unpack('H*',$char[$i-1]) . '-\x' . unpack('H*',$char[$i+1]) . '"';
            }
        }
        else {
            croak "Invalid tr/// range (over 4octets) \"\\x" . unpack('H*',$char[$i-1]) . '-\x' . unpack('H*',$char[$i+1]) . '"';
        }

        splice @char, $i-1, 3, @range;
    }

    return @char;
}

#
# UHC open character class
#
sub _cc {
    if (scalar(@_) == 0) {
        die __FILE__, ": function cc got no parameter.";
    }
    elsif (scalar(@_) == 1) {
        return sprintf('\x%02X',$_[0]);
    }
    elsif (scalar(@_) == 2) {
        if ($_[0] > $_[1]) {
            die __FILE__, ": function cc got \$_[0] > \$_[1] parameters).";
        }
        elsif ($_[0] == $_[1]) {
            return sprintf('\x%02X',$_[0]);
        }
        elsif (($_[0]+1) == $_[1]) {
            return sprintf('[\\x%02X\\x%02X]',$_[0],$_[1]);
        }
        else {
            return sprintf('[\\x%02X-\\x%02X]',$_[0],$_[1]);
        }
    }
    else {
        die __FILE__, ": function cc got 3 or more parameters (@{[scalar(@_)]} parameters).";
    }
}

#
# UHC octet range
#
sub _octets {
    my $length = shift @_;

    if ($length == 1) {
        my($a1) = unpack 'C', $_[0];
        my($z1) = unpack 'C', $_[1];

        if ($a1 > $z1) {
            croak 'Invalid [] range in regexp (CORE::ord(A) > CORE::ord(B)) ' . '\x' . unpack('H*',$a1) . '-\x' . unpack('H*',$z1);
        }

        if ($a1 == $z1) {
            return sprintf('\x%02X',$a1);
        }
        elsif (($a1+1) == $z1) {
            return sprintf('\x%02X\x%02X',$a1,$z1);
        }
        else {
            return sprintf('\x%02X-\x%02X',$a1,$z1);
        }
    }
    elsif ($length == 2) {
        my($a1,$a2) = unpack 'CC', $_[0];
        my($z1,$z2) = unpack 'CC', $_[1];
        my($A1,$A2) = unpack 'CC', $_[2];
        my($Z1,$Z2) = unpack 'CC', $_[3];

        if ($a1 == $z1) {
            return (
            #   11111111   222222222222
            #        A          A   Z
                _cc($a1) . _cc($a2,$z2), # a2-z2
            );
        }
        elsif (($a1+1) == $z1) {
            return (
            #   11111111111   222222222222
            #        A  Z          A   Z
                _cc($a1)    . _cc($a2,$Z2), # a2-
                _cc(   $z1) . _cc($A2,$z2), #   -z2
            );
        }
        else {
            return (
            #   1111111111111111   222222222222
            #        A     Z            A   Z
                _cc($a1)         . _cc($a2,$Z2), # a2-
                _cc($a1+1,$z1-1) . _cc($A2,$Z2), #   -
                _cc(      $z1)   . _cc($A2,$z2), #   -z2
            );
        }
    }
    elsif ($length == 3) {
        my($a1,$a2,$a3) = unpack 'CCC', $_[0];
        my($z1,$z2,$z3) = unpack 'CCC', $_[1];
        my($A1,$A2,$A3) = unpack 'CCC', $_[2];
        my($Z1,$Z2,$Z3) = unpack 'CCC', $_[3];

        if ($a1 == $z1) {
            if ($a2 == $z2) {
                return (
                #   11111111   22222222   333333333333
                #        A          A          A   Z
                    _cc($a1) . _cc($a2) . _cc($a3,$z3), # a3-z3
                );
            }
            elsif (($a2+1) == $z2) {
                return (
                #   11111111   22222222222   333333333333
                #        A          A  Z          A   Z
                    _cc($a1) . _cc($a2)    . _cc($a3,$Z3), # a3-
                    _cc($a1) . _cc(   $z2) . _cc($A3,$z3), #   -z3
                );
            }
            else {
                return (
                #   11111111   2222222222222222   333333333333
                #        A          A     Z            A   Z
                    _cc($a1) . _cc($a2)         . _cc($a3,$Z3), # a3-
                    _cc($a1) . _cc($a2+1,$z2-1) . _cc($A3,$Z3), #   -
                    _cc($a1) . _cc(      $z2)   . _cc($A3,$z3), #   -z3
                );
            }
        }
        elsif (($a1+1) == $z1) {
            return (
            #   11111111111   22222222222222   333333333333
            #        A  Z          A     Z          A   Z
                _cc($a1)    . _cc($a2)       . _cc($a3,$Z3), # a3-
                _cc($a1)    . _cc($a2+1,$Z2) . _cc($A3,$Z3), #   -
                _cc(   $z1) . _cc($A2,$z2-1) . _cc($A3,$Z3), #   -
                _cc(   $z1) . _cc(    $z2)   . _cc($A3,$z3), #   -z3
            );
        }
        else {
            return (
            #   1111111111111111   22222222222222   333333333333
            #        A     Z            A     Z          A   Z
                _cc($a1)         . _cc($a2)       . _cc($a3,$Z3), # a3-
                _cc($a1)         . _cc($a2+1,$Z2) . _cc($A3,$Z3), #   -
                _cc($a1+1,$z1-1) . _cc($A2,$Z2)   . _cc($A3,$Z3), #   -
                _cc(      $z1)   . _cc($A2,$z2-1) . _cc($A3,$Z3), #   -
                _cc(      $z1)   . _cc(    $z2)   . _cc($A3,$z3), #   -z3
            );
        }
    }
    elsif ($length == 4) {
        my($a1,$a2,$a3,$a4) = unpack 'CCCC', $_[0];
        my($z1,$z2,$z3,$z4) = unpack 'CCCC', $_[1];
        my($A1,$A2,$A3,$A4) = unpack 'CCCC', $_[0];
        my($Z1,$Z2,$Z3,$Z4) = unpack 'CCCC', $_[1];

        if ($a1 == $z1) {
            if ($a2 == $z2) {
                if ($a3 == $z3) {
                    return (
                    #   11111111   22222222   33333333   444444444444
                    #        A          A          A          A   Z
                        _cc($a1) . _cc($a2) . _cc($a3) . _cc($a4,$z4), # a4-z4
                    );
                }
                elsif (($a3+1) == $z3) {
                    return (
                    #   11111111   22222222   33333333333   444444444444
                    #        A          A          A  Z          A   Z
                        _cc($a1) . _cc($a2) . _cc($a3)    . _cc($a4,$Z4), # a4-
                        _cc($a1) . _cc($a2) . _cc(   $z3) . _cc($A4,$z4), #   -z4
                    );
                }
                else {
                    return (
                    #   11111111   22222222   3333333333333333   444444444444
                    #        A          A          A     Z            A   Z
                        _cc($a1) . _cc($a2) . _cc($a3)         . _cc($a4,$Z4), # a4-
                        _cc($a1) . _cc($a2) . _cc($a3+1,$z3-1) . _cc($A4,$Z4), #   -
                        _cc($a1) . _cc($a2) . _cc(      $z3)   . _cc($A4,$z4), #   -z4
                    );
                }
            }
            elsif (($a2+1) == $z2) {
                return (
                #   11111111   22222222222   33333333333333   444444444444
                #        A          A  Z          A     Z          A   Z
                    _cc($a1) . _cc($a2)    . _cc($a3)       . _cc($a4,$Z4), # a4-
                    _cc($a1) . _cc($a2)    . _cc($a3+1,$Z3) . _cc($A4,$Z4), #   -
                    _cc($a1) . _cc(   $z2) . _cc($A3,$z3-1) . _cc($A4,$Z4), #   -
                    _cc($a1) . _cc(   $z2) . _cc(    $z3)   . _cc($A4,$z4), #   -z4
                );
            }
            else {
                return (
                #   11111111   2222222222222222   33333333333333   444444444444
                #        A          A     Z            A     Z          A   Z
                    _cc($a1) . _cc($a2)         . _cc($a3)       . _cc($a4,$Z4), # a4-
                    _cc($a1) . _cc($a2)         . _cc($a3+1,$Z3) . _cc($A4,$Z4), #   -
                    _cc($a1) . _cc($a2+1,$z2-1) . _cc($A3,$Z3)   . _cc($A4,$Z4), #   -
                    _cc($a1) . _cc(      $z2)   . _cc($A3,$z3-1) . _cc($A4,$Z4), #   -
                    _cc($a1) . _cc(      $z2)   . _cc(    $z3)   . _cc($A4,$z4), #   -z4
                );
            }
        }
        elsif (($a1+1) == $z1) {
            return (
            #   11111111111   22222222222222   33333333333333   444444444444
            #        A  Z          A     Z          A     Z          A   Z
                _cc($a1)    . _cc($a2)       . _cc($a3)       . _cc($a4,$Z4), # a4-
                _cc($a1)    . _cc($a2)       . _cc($a3+1,$Z3) . _cc($A4,$Z4), #   -
                _cc($a1)    . _cc($a2+1,$Z2) . _cc($A3,$Z3)   . _cc($A4,$Z4), #   -
                _cc(   $z1) . _cc($A2,$z2-1) . _cc($A3,$Z3)   . _cc($A4,$Z4), #   -
                _cc(   $z1) . _cc(    $z2)   . _cc($A3,$z3-1) . _cc($A4,$Z4), #   -
                _cc(   $z1) . _cc(    $z2)   . _cc(    $z3)   . _cc($A4,$z4), #   -z4
            );
        }
        else {
            return (
            #   1111111111111111   22222222222222   33333333333333   444444444444
            #        A     Z            A     Z          A     Z          A   Z
                _cc($a1)         . _cc($a2)       . _cc($a3)       . _cc($a4,$Z4), # a4-
                _cc($a1)         . _cc($a2)       . _cc($a3+1,$Z3) . _cc($A4,$Z4), #   -
                _cc($a1)         . _cc($a2+1,$Z2) . _cc($A3,$Z3)   . _cc($A4,$Z4), #   -
                _cc($a1+1,$z1-1) . _cc($A2,$Z2)   . _cc($A3,$Z3)   . _cc($A4,$Z4), #   -
                _cc(      $z1)   . _cc($A2,$z2-1) . _cc($A3,$Z3)   . _cc($A4,$Z4), #   -
                _cc(      $z1)   . _cc(    $z2)   . _cc($A3,$z3-1) . _cc($A4,$Z4), #   -
                _cc(      $z1)   . _cc(    $z2)   . _cc(    $z3)   . _cc($A4,$z4), #   -z4
            );
        }
    }
    else {
        die __FILE__, ": function _octets got invalid length ($length).";
    }
}

#
# UHC range regexp
#
sub _range_regexp {
    my($length,$first,$last) = @_;

    my @range_regexp = ();
    if (not exists $range_tr{$length}) {
        return @range_regexp;
    }

    my @ranges = @{ $range_tr{$length} };
    while (my @range = splice(@ranges,0,$length)) {
        my $min = '';
        my $max = '';
        for (my $i=0; $i < $length; $i++) {
            $min .= pack 'C', $range[$i][0];
            $max .= pack 'C', $range[$i][-1];
        }

# min___max
#            FIRST_____________LAST
#       (nothing)

        if ($max lt $first) {
        }

#            **********
#       min_________max
#            FIRST_____________LAST
#            **********

        elsif (($min le $first) and ($first le $max) and ($max le $last)) {
            push @range_regexp, _octets($length,$first,$max,$min,$max);
        }

#            **********************
#            min________________max
#            FIRST_____________LAST
#            **********************

        elsif (($min eq $first) and ($max eq $last)) {
            push @range_regexp, _octets($length,$first,$last,$min,$max);
        }

#                   *********
#                   min___max
#            FIRST_____________LAST
#                   *********

        elsif (($first le $min) and ($max le $last)) {
            push @range_regexp, _octets($length,$min,$max,$min,$max);
        }

#            **********************
#       min__________________________max
#            FIRST_____________LAST
#            **********************

        elsif (($min le $first) and ($last le $max)) {
            push @range_regexp, _octets($length,$first,$last,$min,$max);
        }

#                         *********
#                         min________max
#            FIRST_____________LAST
#                         *********

        elsif (($first le $min) and ($min le $last) and ($last le $max)) {
            push @range_regexp, _octets($length,$min,$last,$min,$max);
        }

#                                    min___max
#            FIRST_____________LAST
#                              (nothing)

        elsif ($last lt $min) {
        }

        else {
            die __FILE__, ": function _range_regexp panic.";
        }
    }

    return @range_regexp;
}

#
# UHC open character list for qr and not qr
#
sub _charlist {

    my $modifier = pop @_;
    my @char = @_;

    my $ignorecase = ($modifier =~ /i/oxms) ? 1 : 0;

    # unescape character
    for (my $i=0; $i <= $#char; $i++) {

        # escape - to ...
        if ($char[$i] eq '-') {
            if ((0 < $i) and ($i < $#char)) {
                $char[$i] = '...';
            }
        }

        # octal escape sequence
        elsif ($char[$i] =~ /\A \\o \{ ([0-7]+) \} \z/oxms) {
            $char[$i] = octchr($1);
        }

        # hexadecimal escape sequence
        elsif ($char[$i] =~ /\A \\x \{ ([0-9A-Fa-f]+) \} \z/oxms) {
            $char[$i] = hexchr($1);
        }

        # \N{CHARNAME} --> N\{CHARNAME}
        elsif ($char[$i] =~ /\A \\ (N) ( \{ ([^\x81-\xFE0-9\}][^\x81-\xFE\}]*) \} ) \z/oxms) {
            $char[$i] = $1 . '\\' . $2;
        }

        # \p{PROPERTY} --> p\{PROPERTY}
        elsif ($char[$i] =~ /\A \\ (p) ( \{ ([^\x81-\xFE0-9\}][^\x81-\xFE\}]*) \} ) \z/oxms) {
            $char[$i] = $1 . '\\' . $2;
        }

        # \P{PROPERTY} --> P\{PROPERTY}
        elsif ($char[$i] =~ /\A \\ (P) ( \{ ([^\x81-\xFE0-9\}][^\x81-\xFE\}]*) \} ) \z/oxms) {
            $char[$i] = $1 . '\\' . $2;
        }

        # \p, \P, \X --> p, P, X
        elsif ($char[$i] =~ /\A \\ ( [pPX] ) \z/oxms) {
            $char[$i] = $1;
        }

        elsif ($char[$i] =~ /\A \\ ([0-7]{2,3}) \z/oxms) {
            $char[$i] = CORE::chr oct $1;
        }
        elsif ($char[$i] =~ /\A \\x ([0-9A-Fa-f]{1,2}) \z/oxms) {
            $char[$i] = CORE::chr hex $1;
        }
        elsif ($char[$i] =~ /\A \\c ([\x40-\x5F]) \z/oxms) {
            $char[$i] = CORE::chr(CORE::ord($1) & 0x1F);
        }
        elsif ($char[$i] =~ /\A (\\ [0nrtfbaedswDSWHVhvR]) \z/oxms) {
            $char[$i] = {
                '\0' => "\0",
                '\n' => "\n",
                '\r' => "\r",
                '\t' => "\t",
                '\f' => "\f",
                '\b' => "\x08", # \b means backspace in character class
                '\a' => "\a",
                '\e' => "\e",
                '\d' => '[0-9]',

                         # \t  \n  \f  \r space
                '\s' => '[\x09\x0A\x0C\x0D\x20]',

                # Incompatible Changes
                # \s in regular expressions now matches a Vertical Tab (experimental)
                # http://search.cpan.org/~zefram/perl-5.17.0/pod/perldelta.pod

                # '\s' => '[\x09\x0A\x0B\x0C\x0D\x20]',

                '\w' => '[0-9A-Z_a-z]',
                '\D' => '${Char::Euhc::eD}',
                '\S' => '${Char::Euhc::eS}',
                '\W' => '${Char::Euhc::eW}',

                '\H' => '${Char::Euhc::eH}',
                '\V' => '${Char::Euhc::eV}',
                '\h' => '[\x09\x20]',
                '\v' => '[\x0A\x0B\x0C\x0D]',
                '\R' => '${Char::Euhc::eR}',

            }->{$1};
        }

        # POSIX-style character classes
        elsif ($ignorecase and ($char[$i] =~ /\A ( \[\: \^? (?:lower|upper) :\] ) \z/oxms)) {
            $char[$i] = {

                '[:lower:]'   => '[\x41-\x5A\x61-\x7A]',
                '[:upper:]'   => '[\x41-\x5A\x61-\x7A]',
                '[:^lower:]'  => '${Char::Euhc::not_lower_i}',
                '[:^upper:]'  => '${Char::Euhc::not_upper_i}',

            }->{$1};
        }
        elsif ($char[$i] =~ /\A ( \[\: \^? (?:alnum|alpha|ascii|blank|cntrl|digit|graph|lower|print|punct|space|upper|word|xdigit) :\] ) \z/oxms) {
            $char[$i] = {

                '[:alnum:]'   => '[\x30-\x39\x41-\x5A\x61-\x7A]',
                '[:alpha:]'   => '[\x41-\x5A\x61-\x7A]',
                '[:ascii:]'   => '[\x00-\x7F]',
                '[:blank:]'   => '[\x09\x20]',
                '[:cntrl:]'   => '[\x00-\x1F\x7F]',
                '[:digit:]'   => '[\x30-\x39]',
                '[:graph:]'   => '[\x21-\x7F]',
                '[:lower:]'   => '[\x61-\x7A]',
                '[:print:]'   => '[\x20-\x7F]',
                '[:punct:]'   => '[\x21-\x2F\x3A-\x3F\x40\x5B-\x5F\x60\x7B-\x7E]',
                '[:space:]'   => '[\x09\x0A\x0B\x0C\x0D\x20]',
                '[:upper:]'   => '[\x41-\x5A]',
                '[:word:]'    => '[\x30-\x39\x41-\x5A\x5F\x61-\x7A]',
                '[:xdigit:]'  => '[\x30-\x39\x41-\x46\x61-\x66]',
                '[:^alnum:]'  => '${Char::Euhc::not_alnum}',
                '[:^alpha:]'  => '${Char::Euhc::not_alpha}',
                '[:^ascii:]'  => '${Char::Euhc::not_ascii}',
                '[:^blank:]'  => '${Char::Euhc::not_blank}',
                '[:^cntrl:]'  => '${Char::Euhc::not_cntrl}',
                '[:^digit:]'  => '${Char::Euhc::not_digit}',
                '[:^graph:]'  => '${Char::Euhc::not_graph}',
                '[:^lower:]'  => '${Char::Euhc::not_lower}',
                '[:^print:]'  => '${Char::Euhc::not_print}',
                '[:^punct:]'  => '${Char::Euhc::not_punct}',
                '[:^space:]'  => '${Char::Euhc::not_space}',
                '[:^upper:]'  => '${Char::Euhc::not_upper}',
                '[:^word:]'   => '${Char::Euhc::not_word}',
                '[:^xdigit:]' => '${Char::Euhc::not_xdigit}',

            }->{$1};
        }
        elsif ($char[$i] =~ /\A \\ ($q_char) \z/oxms) {
            $char[$i] = $1;
        }
    }

    # open character list
    my @singleoctet   = ();
    my @multipleoctet = ();
    for (my $i=0; $i <= $#char; ) {

        # escaped -
        if (defined($char[$i+1]) and ($char[$i+1] eq '...')) {
            $i += 1;
            next;
        }

        # make range regexp
        elsif ($char[$i] eq '...') {

            # range error
            if (CORE::length($char[$i-1]) > CORE::length($char[$i+1])) {
                croak 'Invalid [] range in regexp (length(A) > length(B)) ' . '\x' . unpack('H*',$char[$i-1]) . '-\x' . unpack('H*',$char[$i+1]);
            }
            elsif (CORE::length($char[$i-1]) == CORE::length($char[$i+1])) {
                if ($char[$i-1] gt $char[$i+1]) {
                    croak 'Invalid [] range in regexp (CORE::ord(A) > CORE::ord(B)) ' . '\x' . unpack('H*',$char[$i-1]) . '-\x' . unpack('H*',$char[$i+1]);
                }
            }

            # make range regexp per length
            for my $length (CORE::length($char[$i-1]) .. CORE::length($char[$i+1])) {
                my @regexp = ();

                # is first and last
                if (($length == CORE::length($char[$i-1])) and ($length == CORE::length($char[$i+1]))) {
                    push @regexp, _range_regexp($length, $char[$i-1], $char[$i+1]);
                }

                # is first
                elsif ($length == CORE::length($char[$i-1])) {
                    push @regexp, _range_regexp($length, $char[$i-1], "\xFF" x $length);
                }

                # is inside in first and last
                elsif ((CORE::length($char[$i-1]) < $length) and ($length < CORE::length($char[$i+1]))) {
                    push @regexp, _range_regexp($length, "\x00" x $length, "\xFF" x $length);
                }

                # is last
                elsif ($length == CORE::length($char[$i+1])) {
                    push @regexp, _range_regexp($length, "\x00" x $length, $char[$i+1]);
                }

                else {
                    die __FILE__, ": function make_regexp panic.";
                }

                if ($length == 1) {
                    push @singleoctet, @regexp;
                }
                else {
                    push @multipleoctet, @regexp;
                }
            }

            $i += 2;
        }

        # with /i modifier
        elsif ($char[$i] =~ /\A [\x00-\xFF] \z/oxms) {
            if ($modifier =~ /i/oxms) {
                my $uc = Char::Euhc::uc($char[$i]);
                my $fc = Char::Euhc::fc($char[$i]);
                if ($uc ne $fc) {
                    if (CORE::length($fc) == 1) {
                        push @singleoctet, $uc, $fc;
                    }
                    else {
                        push @singleoctet,   $uc;
                        push @multipleoctet, $fc;
                    }
                }
                else {
                    push @singleoctet, $char[$i];
                }
            }
            else {
                push @singleoctet, $char[$i];
            }
            $i += 1;
        }

        # single character of single octet code
        elsif ($char[$i] =~ /\A (?: \\h ) \z/oxms) {
            push @singleoctet, "\t", "\x20";
            $i += 1;
        }
        elsif ($char[$i] =~ /\A (?: \\v ) \z/oxms) {
            push @singleoctet, "\x0A", "\x0B", "\x0C", "\x0D";
            $i += 1;
        }
        elsif ($char[$i] =~ /\A (?: \\d | \\s | \\w ) \z/oxms) {
            push @singleoctet, $char[$i];
            $i += 1;
        }

        # single character of multiple-octet code
        else {
            push @multipleoctet, $char[$i];
            $i += 1;
        }
    }

    # quote metachar
    for (@singleoctet) {
        if ($_ eq '...') {
            $_ = '-';
        }
        elsif (/\A \n \z/oxms) {
            $_ = '\n';
        }
        elsif (/\A \r \z/oxms) {
            $_ = '\r';
        }
        elsif (/\A ([\x00-\x20\x7F-\xFF]) \z/oxms) {
            $_ = sprintf('\x%02X', CORE::ord $1);
        }
        elsif (/\A [\x00-\xFF] \z/oxms) {
            $_ = quotemeta $_;
        }
    }
    for (@multipleoctet) {
        if (/\A ([\x81-\xFE]) ([\x00-\xFF]) \z/oxms) {
            $_ = $1 . quotemeta $2;
        }
    }

    # return character list
    return \@singleoctet, \@multipleoctet;
}

#
# UHC octal escape sequence
#
sub octchr {
    my($octdigit) = @_;

    my @binary = ();
    for my $octal (split(//,$octdigit)) {
        push @binary, {
            '0' => '000',
            '1' => '001',
            '2' => '010',
            '3' => '011',
            '4' => '100',
            '5' => '101',
            '6' => '110',
            '7' => '111',
        }->{$octal};
    }
    my $binary = join '', @binary;

    my $octchr = {
        #                1234567
        1 => pack('B*', "0000000$binary"),
        2 => pack('B*', "000000$binary"),
        3 => pack('B*', "00000$binary"),
        4 => pack('B*', "0000$binary"),
        5 => pack('B*', "000$binary"),
        6 => pack('B*', "00$binary"),
        7 => pack('B*', "0$binary"),
        0 => pack('B*', "$binary"),

    }->{CORE::length($binary) % 8};

    return $octchr;
}

#
# UHC hexadecimal escape sequence
#
sub hexchr {
    my($hexdigit) = @_;

    my $hexchr = {
        1 => pack('H*', "0$hexdigit"),
        0 => pack('H*', "$hexdigit"),

    }->{CORE::length($_[0]) % 2};

    return $hexchr;
}

#
# UHC open character list for qr
#
sub charlist_qr {

    my $modifier = pop @_;
    my @char = @_;

    my($singleoctet, $multipleoctet) = _charlist(@char, $modifier);
    my @singleoctet   = @$singleoctet;
    my @multipleoctet = @$multipleoctet;

    # return character list
    if (scalar(@singleoctet) >= 1) {

        # with /i modifier
        if ($modifier =~ m/i/oxms) {
            my %singleoctet_ignorecase = ();
            for (@singleoctet) {
                while (s/ \A \\x(..) - \\x(..) //oxms or s/ \A \\x((..)) //oxms) {
                    for my $ord (hex($1) .. hex($2)) {
                        my $char = CORE::chr($ord);
                        my $uc = Char::Euhc::uc($char);
                        my $fc = Char::Euhc::fc($char);
                        if ($uc eq $fc) {
                            $singleoctet_ignorecase{unpack 'C*', $char} = 1;
                        }
                        else {
                            if (CORE::length($fc) == 1) {
                                $singleoctet_ignorecase{unpack 'C*', $uc} = 1;
                                $singleoctet_ignorecase{unpack 'C*', $fc} = 1;
                            }
                            else {
                                $singleoctet_ignorecase{unpack 'C*', $uc} = 1;
                                push @multipleoctet, join '', map {sprintf('\x%02X',$_)} unpack 'C*', $fc;
                            }
                        }
                    }
                }
            }
            my $i = 0;
            my @singleoctet_ignorecase = ();
            for my $ord (0 .. 255) {
                if (exists $singleoctet_ignorecase{$ord}) {
                    push @{$singleoctet_ignorecase[$i]}, $ord;
                }
                else {
                    $i++;
                }
            }
            @singleoctet = ();
            for my $range (@singleoctet_ignorecase) {
                if (ref $range) {
                    if (scalar(@{$range}) == 1) {
                        push @singleoctet, sprintf('\x%02X', @{$range}[0]);
                    }
                    elsif (scalar(@{$range}) == 2) {
                        push @singleoctet, sprintf('\x%02X\x%02X', @{$range}[0], @{$range}[-1]);
                    }
                    else {
                        push @singleoctet, sprintf('\x%02X-\x%02X', @{$range}[0], @{$range}[-1]);
                    }
                }
            }
        }

        my $not_anchor = '';
        $not_anchor = '(?![\x81-\xFE])';

        push @multipleoctet, join('', $not_anchor, '[', @singleoctet, ']' );
    }
    if (scalar(@multipleoctet) >= 2) {
        return '(?:' . join('|', @multipleoctet) . ')';
    }
    else {
        return $multipleoctet[0];
    }
}

#
# UHC open character list for not qr
#
sub charlist_not_qr {

    my $modifier = pop @_;
    my @char = @_;

    my($singleoctet, $multipleoctet) = _charlist(@char, $modifier);
    my @singleoctet   = @$singleoctet;
    my @multipleoctet = @$multipleoctet;

    # with /i modifier
    if ($modifier =~ m/i/oxms) {
        my %singleoctet_ignorecase = ();
        for (@singleoctet) {
            while (s/ \A \\x(..) - \\x(..) //oxms or s/ \A \\x((..)) //oxms) {
                for my $ord (hex($1) .. hex($2)) {
                    my $char = CORE::chr($ord);
                    my $uc = Char::Euhc::uc($char);
                    my $fc = Char::Euhc::fc($char);
                    if ($uc eq $fc) {
                        $singleoctet_ignorecase{unpack 'C*', $char} = 1;
                    }
                    else {
                        if (CORE::length($fc) == 1) {
                            $singleoctet_ignorecase{unpack 'C*', $uc} = 1;
                            $singleoctet_ignorecase{unpack 'C*', $fc} = 1;
                        }
                        else {
                            $singleoctet_ignorecase{unpack 'C*', $uc} = 1;
                            push @multipleoctet, join '', map {sprintf('\x%02X',$_)} unpack 'C*', $fc;
                        }
                    }
                }
            }
        }
        my $i = 0;
        my @singleoctet_ignorecase = ();
        for my $ord (0 .. 255) {
            if (exists $singleoctet_ignorecase{$ord}) {
                push @{$singleoctet_ignorecase[$i]}, $ord;
            }
            else {
                $i++;
            }
        }
        @singleoctet = ();
        for my $range (@singleoctet_ignorecase) {
            if (ref $range) {
                if (scalar(@{$range}) == 1) {
                    push @singleoctet, sprintf('\x%02X', @{$range}[0]);
                }
                elsif (scalar(@{$range}) == 2) {
                    push @singleoctet, sprintf('\x%02X\x%02X', @{$range}[0], @{$range}[-1]);
                }
                else {
                    push @singleoctet, sprintf('\x%02X-\x%02X', @{$range}[0], @{$range}[-1]);
                }
            }
        }
    }

    # return character list
    if (scalar(@multipleoctet) >= 1) {
        if (scalar(@singleoctet) >= 1) {

            # any character other than multiple-octet and single octet character class
            return '(?!' . join('|', @multipleoctet) . ')(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE' . join('', @singleoctet) . '])';
        }
        else {

            # any character other than multiple-octet character class
            return '(?!' . join('|', @multipleoctet) . ")(?:$your_char)";
        }
    }
    else {
        if (scalar(@singleoctet) >= 1) {

            # any character other than single octet character class
            return                                      '(?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE' . join('', @singleoctet) . '])';
        }
        else {

            # any character
            return                                      "(?:$your_char)";
        }
    }
}

#
# open file in read mode
#
sub _open_r {
    my(undef,$file) = @_;
    $file =~ s#\A ([\x09\x0A\x0C\x0D\x20]) #./$1#oxms;
    return eval(q{open($_[0],'<',$_[1])}) ||
                  open($_[0],"< $file\0");
}

#
# open file in write mode
#
sub _open_w {
    my(undef,$file) = @_;
    $file =~ s#\A ([\x09\x0A\x0C\x0D\x20]) #./$1#oxms;
    return eval(q{open($_[0],'>',$_[1])}) ||
                  open($_[0],"> $file\0");
}

#
# open file in append mode
#
sub _open_a {
    my(undef,$file) = @_;
    $file =~ s#\A ([\x09\x0A\x0C\x0D\x20]) #./$1#oxms;
    return eval(q{open($_[0],'>>',$_[1])}) ||
                  open($_[0],">> $file\0");
}

#
# safe system
#
sub _systemx {

    # P.707 29.2.33. exec
    # in Chapter 29: Functions
    # of ISBN 0-596-00027-8 Programming Perl Third Edition.
    #
    # Be aware that in older releases of Perl, exec (and system) did not flush
    # your output buffer, so you needed to enable command buffering by setting $|
    # on one or more filehandles to avoid lost output in the case of exec, or
    # misordererd output in the case of system. This situation was largely remedied
    # in the 5.6 release of Perl. (So, 5.005 release not yet.)

    # P.855 exec
    # in Chapter 27: Functions
    # of ISBN 978-0-596-00492-7 Programming Perl 4th Edition.
    #
    # In very old release of Perl (before v5.6), exec (and system) did not flush
    # your output buffer, so you needed to enable command buffering by setting $|
    # on one or more filehandles to avoid lost output with exec or misordered
    # output with system.

    $| = 1;

    # P.565 23.1.2. Cleaning Up Your Environment
    # in Chapter 23: Security
    # of ISBN 0-596-00027-8 Programming Perl Third Edition.

    # P.656 Cleaning Up Your Environment
    # in Chapter 20: Security
    # of ISBN 978-0-596-00492-7 Programming Perl 4th Edition.

    # local $ENV{'PATH'} = '.';
    local @ENV{qw(IFS CDPATH ENV BASH_ENV)}; # Make %ENV safer

    # P.707 29.2.33. exec
    # in Chapter 29: Functions
    # of ISBN 0-596-00027-8 Programming Perl Third Edition.
    #
    # As we mentioned earlier, exec treats a discrete list of arguments as an
    # indication that it should bypass shell processing. However, there is one
    # place where you might still get tripped up. The exec call (and system, too)
    # will not distinguish between a single scalar argument and an array containing
    # only one element.
    #
    #     @args = ("echo surprise");  # just one element in list
    #     exec @args                  # still subject to shell escapes
    #         or die "exec: $!";      #   because @args == 1
    #
    # To avoid this, you can use the PATHNAME syntax, explicitly duplicating the
    # first argument as the pathname, which forces the rest of the arguments to be
    # interpreted as a list, even if there is only one of them:
    #
    #     exec { $args[0] } @args  # safe even with one-argument list
    #         or die "can't exec @args: $!";

    # P.855 exec
    # in Chapter 27: Functions
    # of ISBN 978-0-596-00492-7 Programming Perl 4th Edition.
    #
    # As we mentioned earlier, exec treats a discrete list of arguments as a
    # directive to bypass shell processing. However, there is one place where
    # you might still get tripped up. The exec call (and system, too) cannot
    # distinguish between a single scalar argument and an array containing
    # only one element.
    #
    #     @args = ("echo surprise");  # just one element in list
    #     exec @args                  # still subject to shell escapes
    #         || die "exec: $!";      #   because @args == 1
    #
    # To avoid this, use the PATHNAME syntax, explicitly duplicating the first
    # argument as the pathname, which forces the rest of the arguments to be
    # interpreted as a list, even if there is only one of them:
    #
    #     exec { $args[0] } @args  # safe even with one-argument list
    #         || die "can't exec @args: $!";

    return CORE::system { $_[0] } @_; # safe even with one-argument list
}

#
# UHC order to character (with parameter)
#
sub Char::Euhc::chr(;$) {

    my $c = @_ ? $_[0] : $_;

    if ($c == 0x00) {
        return "\x00";
    }
    else {
        my @chr = ();
        while ($c > 0) {
            unshift @chr, ($c % 0x100);
            $c = int($c / 0x100);
        }
        return pack 'C*', @chr;
    }
}

#
# UHC order to character (without parameter)
#
sub Char::Euhc::chr_() {

    my $c = $_;

    if ($c == 0x00) {
        return "\x00";
    }
    else {
        my @chr = ();
        while ($c > 0) {
            unshift @chr, ($c % 0x100);
            $c = int($c / 0x100);
        }
        return pack 'C*', @chr;
    }
}

#
# UHC stacked file test expr
#
sub Char::Euhc::filetest {

    my $file     = pop @_;
    my $filetest = substr(pop @_, 1);

    unless (eval qq{Char::Euhc::$filetest(\$file)}) {
        return '';
    }
    for my $filetest (CORE::reverse @_) {
        unless (eval qq{ $filetest _ }) {
            return '';
        }
    }
    return 1;
}

#
# UHC file test -r expr
#
sub Char::Euhc::r(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -r (Char::Euhc::r)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? (-r _,@_) : -r _;
    }

    # P.908 32.39. Symbol
    # in Chapter 32: Standard Modules
    # of ISBN 0-596-00027-8 Programming Perl Third Edition.

    # P.326 Prototypes
    # in Chapter 7: Subroutines
    # of ISBN 978-0-596-00492-7 Programming Perl 4th Edition.

    # (and so on)

    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? (-r $fh,@_) : -r $fh;
    }
    elsif (-e $_) {
        return wantarray ? (-r _,@_) : -r _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return wantarray ? (-r _,@_) : -r _;
        }
        else {

            # Even if ${^WIN32_SLOPPY_STAT} is set to a true value, Char::Euhc::*()
            # on Windows opens the file for the path which has 5c at end.
            # (and so on)

            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $r = -r $fh;
                close $fh;
                return wantarray ? ($r,@_) : $r;
            }
        }
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC file test -w expr
#
sub Char::Euhc::w(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -w (Char::Euhc::w)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? (-w _,@_) : -w _;
    }
    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? (-w $fh,@_) : -w $fh;
    }
    elsif (-e $_) {
        return wantarray ? (-w _,@_) : -w _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return wantarray ? (-w _,@_) : -w _;
        }
        else {
            my $fh = gensym();
            if (_open_a($fh, $_)) {
                my $w = -w $fh;
                close $fh;
                return wantarray ? ($w,@_) : $w;
            }
        }
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC file test -x expr
#
sub Char::Euhc::x(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -x (Char::Euhc::x)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? (-x _,@_) : -x _;
    }
    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? (-x $fh,@_) : -x $fh;
    }
    elsif (-e $_) {
        return wantarray ? (-x _,@_) : -x _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return wantarray ? (-x _,@_) : -x _;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $dummy_for_underline_cache = -x $fh;
                close $fh;
            }

            # filename is not .COM .EXE .BAT .CMD
            return wantarray ? ('',@_) : '';
        }
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC file test -o expr
#
sub Char::Euhc::o(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -o (Char::Euhc::o)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? (-o _,@_) : -o _;
    }
    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? (-o $fh,@_) : -o $fh;
    }
    elsif (-e $_) {
        return wantarray ? (-o _,@_) : -o _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return wantarray ? (-o _,@_) : -o _;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $o = -o $fh;
                close $fh;
                return wantarray ? ($o,@_) : $o;
            }
        }
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC file test -R expr
#
sub Char::Euhc::R(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -R (Char::Euhc::R)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? (-R _,@_) : -R _;
    }
    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? (-R $fh,@_) : -R $fh;
    }
    elsif (-e $_) {
        return wantarray ? (-R _,@_) : -R _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return wantarray ? (-R _,@_) : -R _;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $R = -R $fh;
                close $fh;
                return wantarray ? ($R,@_) : $R;
            }
        }
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC file test -W expr
#
sub Char::Euhc::W(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -W (Char::Euhc::W)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? (-W _,@_) : -W _;
    }
    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? (-W $fh,@_) : -W $fh;
    }
    elsif (-e $_) {
        return wantarray ? (-W _,@_) : -W _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return wantarray ? (-W _,@_) : -W _;
        }
        else {
            my $fh = gensym();
            if (_open_a($fh, $_)) {
                my $W = -W $fh;
                close $fh;
                return wantarray ? ($W,@_) : $W;
            }
        }
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC file test -X expr
#
sub Char::Euhc::X(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -X (Char::Euhc::X)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? (-X _,@_) : -X _;
    }
    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? (-X $fh,@_) : -X $fh;
    }
    elsif (-e $_) {
        return wantarray ? (-X _,@_) : -X _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return wantarray ? (-X _,@_) : -X _;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $dummy_for_underline_cache = -X $fh;
                close $fh;
            }

            # filename is not .COM .EXE .BAT .CMD
            return wantarray ? ('',@_) : '';
        }
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC file test -O expr
#
sub Char::Euhc::O(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -O (Char::Euhc::O)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? (-O _,@_) : -O _;
    }
    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? (-O $fh,@_) : -O $fh;
    }
    elsif (-e $_) {
        return wantarray ? (-O _,@_) : -O _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return wantarray ? (-O _,@_) : -O _;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $O = -O $fh;
                close $fh;
                return wantarray ? ($O,@_) : $O;
            }
        }
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC file test -e expr
#
sub Char::Euhc::e(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -e (Char::Euhc::e)' if @_ and not wantarray;

    local $^W = 0;

    my $fh = qualify_to_ref $_;
    if ($_ eq '_') {
        return wantarray ? (-e _,@_) : -e _;
    }

    # return false if directory handle
    elsif (defined Char::Euhc::telldir($fh)) {
        return wantarray ? ('',@_) : '';
    }

    # return true if file handle
    elsif (defined fileno $fh) {
        return wantarray ? (1,@_) : 1;
    }

    elsif (-e $_) {
        return wantarray ? (1,@_) : 1;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return wantarray ? (1,@_) : 1;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $e = -e $fh;
                close $fh;
                return wantarray ? ($e,@_) : $e;
            }
        }
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC file test -z expr
#
sub Char::Euhc::z(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -z (Char::Euhc::z)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? (-z _,@_) : -z _;
    }
    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? (-z $fh,@_) : -z $fh;
    }
    elsif (-e $_) {
        return wantarray ? (-z _,@_) : -z _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return wantarray ? (-z _,@_) : -z _;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $z = -z $fh;
                close $fh;
                return wantarray ? ($z,@_) : $z;
            }
        }
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC file test -s expr
#
sub Char::Euhc::s(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -s (Char::Euhc::s)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? (-s _,@_) : -s _;
    }
    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? (-s $fh,@_) : -s $fh;
    }
    elsif (-e $_) {
        return wantarray ? (-s _,@_) : -s _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return wantarray ? (-s _,@_) : -s _;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $s = -s $fh;
                close $fh;
                return wantarray ? ($s,@_) : $s;
            }
        }
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC file test -f expr
#
sub Char::Euhc::f(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -f (Char::Euhc::f)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? (-f _,@_) : -f _;
    }
    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? (-f $fh,@_) : -f $fh;
    }
    elsif (-e $_) {
        return wantarray ? (-f _,@_) : -f _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return wantarray ? ('',@_) : '';
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $f = -f $fh;
                close $fh;
                return wantarray ? ($f,@_) : $f;
            }
        }
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC file test -d expr
#
sub Char::Euhc::d(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -d (Char::Euhc::d)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? (-d _,@_) : -d _;
    }

    # return false if file handle or directory handle
    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? ('',@_) : '';
    }
    elsif (-e $_) {
        return wantarray ? (-d _,@_) : -d _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        return wantarray ? (-d "$_/.",@_) : -d "$_/.";
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC file test -l expr
#
sub Char::Euhc::l(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -l (Char::Euhc::l)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? (-l _,@_) : -l _;
    }
    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? (-l $fh,@_) : -l $fh;
    }
    elsif (-e $_) {
        return wantarray ? (-l _,@_) : -l _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return wantarray ? (-l _,@_) : -l _;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $l = -l $fh;
                close $fh;
                return wantarray ? ($l,@_) : $l;
            }
        }
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC file test -p expr
#
sub Char::Euhc::p(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -p (Char::Euhc::p)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? (-p _,@_) : -p _;
    }
    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? (-p $fh,@_) : -p $fh;
    }
    elsif (-e $_) {
        return wantarray ? (-p _,@_) : -p _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return wantarray ? (-p _,@_) : -p _;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $p = -p $fh;
                close $fh;
                return wantarray ? ($p,@_) : $p;
            }
        }
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC file test -S expr
#
sub Char::Euhc::S(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -S (Char::Euhc::S)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? (-S _,@_) : -S _;
    }
    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? (-S $fh,@_) : -S $fh;
    }
    elsif (-e $_) {
        return wantarray ? (-S _,@_) : -S _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return wantarray ? (-S _,@_) : -S _;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $S = -S $fh;
                close $fh;
                return wantarray ? ($S,@_) : $S;
            }
        }
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC file test -b expr
#
sub Char::Euhc::b(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -b (Char::Euhc::b)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? (-b _,@_) : -b _;
    }
    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? (-b $fh,@_) : -b $fh;
    }
    elsif (-e $_) {
        return wantarray ? (-b _,@_) : -b _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return wantarray ? (-b _,@_) : -b _;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $b = -b $fh;
                close $fh;
                return wantarray ? ($b,@_) : $b;
            }
        }
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC file test -c expr
#
sub Char::Euhc::c(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -c (Char::Euhc::c)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? (-c _,@_) : -c _;
    }
    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? (-c $fh,@_) : -c $fh;
    }
    elsif (-e $_) {
        return wantarray ? (-c _,@_) : -c _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return wantarray ? (-c _,@_) : -c _;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $c = -c $fh;
                close $fh;
                return wantarray ? ($c,@_) : $c;
            }
        }
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC file test -u expr
#
sub Char::Euhc::u(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -u (Char::Euhc::u)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? (-u _,@_) : -u _;
    }
    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? (-u $fh,@_) : -u $fh;
    }
    elsif (-e $_) {
        return wantarray ? (-u _,@_) : -u _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return wantarray ? (-u _,@_) : -u _;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $u = -u $fh;
                close $fh;
                return wantarray ? ($u,@_) : $u;
            }
        }
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC file test -g expr
#
sub Char::Euhc::g(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -g (Char::Euhc::g)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? (-g _,@_) : -g _;
    }
    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? (-g $fh,@_) : -g $fh;
    }
    elsif (-e $_) {
        return wantarray ? (-g _,@_) : -g _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return wantarray ? (-g _,@_) : -g _;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $g = -g $fh;
                close $fh;
                return wantarray ? ($g,@_) : $g;
            }
        }
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC file test -k expr
#
sub Char::Euhc::k(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -k (Char::Euhc::k)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? ('',@_) : '';
    }
    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? ('',@_) : '';
    }
    elsif ($] =~ /^5\.008/oxms) {
        return wantarray ? ('',@_) : '';
    }
    return wantarray ? ($_,@_) : $_;
}

#
# UHC file test -T expr
#
sub Char::Euhc::T(;*@) {

    local $_ = shift if @_;

    # Use of croak without parentheses makes die on Strawberry Perl 5.008 and 5.010, like:
    #     croak 'Too many arguments for -T (Char::Euhc::T)';
    # Must be used by parentheses like:
    #     croak('Too many arguments for -T (Char::Euhc::T)');

    if (@_ and not wantarray) {
        croak('Too many arguments for -T (Char::Euhc::T)');
    }

    my $T = 1;

    my $fh = qualify_to_ref $_;
    if (defined fileno $fh) {

        if (defined Char::Euhc::telldir($fh)) {
            return wantarray ? (undef,@_) : undef;
        }

        # P.813 29.2.176. tell
        # in Chapter 29: Functions
        # of ISBN 0-596-00027-8 Programming Perl Third Edition.

        # P.970 tell
        # in Chapter 27: Functions
        # of ISBN 978-0-596-00492-7 Programming Perl 4th Edition.

        # (and so on)

        my $systell = sysseek $fh, 0, 1;

        if (sysread $fh, my $block, 512) {

            # P.163 Binary file check in Little Perl Parlor 16
            # of Book No. T1008901080816 ZASSHI 08901-8 UNIX MAGAZINE 1993 Aug VOL8#8
            # (and so on)

            if ($block =~ /[\000\377]/oxms) {
                $T = '';
            }
            elsif (($block =~ tr/\000-\007\013\016-\032\034-\037\377//) * 10 > CORE::length $block) {
                $T = '';
            }
        }

        # 0 byte or eof
        else {
            $T = 1;
        }

        my $dummy_for_underline_cache = -T $fh;
        sysseek $fh, $systell, 0;
    }
    else {
        if (-d $_ or -d "$_/.") {
            return wantarray ? (undef,@_) : undef;
        }

        $fh = gensym();
        if (_open_r($fh, $_)) {
        }
        else {
            return wantarray ? (undef,@_) : undef;
        }
        if (sysread $fh, my $block, 512) {
            if ($block =~ /[\000\377]/oxms) {
                $T = '';
            }
            elsif (($block =~ tr/\000-\007\013\016-\032\034-\037\377//) * 10 > CORE::length $block) {
                $T = '';
            }
        }

        # 0 byte or eof
        else {
            $T = 1;
        }
        my $dummy_for_underline_cache = -T $fh;
        close $fh;
    }

    return wantarray ? ($T,@_) : $T;
}

#
# UHC file test -B expr
#
sub Char::Euhc::B(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -B (Char::Euhc::B)' if @_ and not wantarray;
    my $B = '';

    my $fh = qualify_to_ref $_;
    if (defined fileno $fh) {

        if (defined Char::Euhc::telldir($fh)) {
            return wantarray ? (undef,@_) : undef;
        }

        my $systell = sysseek $fh, 0, 1;

        if (sysread $fh, my $block, 512) {
            if ($block =~ /[\000\377]/oxms) {
                $B = 1;
            }
            elsif (($block =~ tr/\000-\007\013\016-\032\034-\037\377//) * 10 > CORE::length $block) {
                $B = 1;
            }
        }

        # 0 byte or eof
        else {
            $B = 1;
        }

        my $dummy_for_underline_cache = -B $fh;
        sysseek $fh, $systell, 0;
    }
    else {
        if (-d $_ or -d "$_/.") {
            return wantarray ? (undef,@_) : undef;
        }

        $fh = gensym();
        if (_open_r($fh, $_)) {
        }
        else {
            return wantarray ? (undef,@_) : undef;
        }
        if (sysread $fh, my $block, 512) {
            if ($block =~ /[\000\377]/oxms) {
                $B = 1;
            }
            elsif (($block =~ tr/\000-\007\013\016-\032\034-\037\377//) * 10 > CORE::length $block) {
                $B = 1;
            }
        }

        # 0 byte or eof
        else {
            $B = 1;
        }
        my $dummy_for_underline_cache = -B $fh;
        close $fh;
    }

    return wantarray ? ($B,@_) : $B;
}

#
# UHC file test -M expr
#
sub Char::Euhc::M(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -M (Char::Euhc::M)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? (-M _,@_) : -M _;
    }
    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? (-M $fh,@_) : -M $fh;
    }
    elsif (-e $_) {
        return wantarray ? (-M _,@_) : -M _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return wantarray ? (-M _,@_) : -M _;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,$atime,$mtime,$ctime,$blksize,$blocks) = CORE::stat $fh;
                close $fh;
                my $M = ($^T - $mtime) / (24*60*60);
                return wantarray ? ($M,@_) : $M;
            }
        }
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC file test -A expr
#
sub Char::Euhc::A(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -A (Char::Euhc::A)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? (-A _,@_) : -A _;
    }
    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? (-A $fh,@_) : -A $fh;
    }
    elsif (-e $_) {
        return wantarray ? (-A _,@_) : -A _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return wantarray ? (-A _,@_) : -A _;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,$atime,$mtime,$ctime,$blksize,$blocks) = CORE::stat $fh;
                close $fh;
                my $A = ($^T - $atime) / (24*60*60);
                return wantarray ? ($A,@_) : $A;
            }
        }
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC file test -C expr
#
sub Char::Euhc::C(;*@) {

    local $_ = shift if @_;
    croak 'Too many arguments for -C (Char::Euhc::C)' if @_ and not wantarray;

    if ($_ eq '_') {
        return wantarray ? (-C _,@_) : -C _;
    }
    elsif (defined fileno(my $fh = qualify_to_ref $_)) {
        return wantarray ? (-C $fh,@_) : -C $fh;
    }
    elsif (-e $_) {
        return wantarray ? (-C _,@_) : -C _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return wantarray ? (-C _,@_) : -C _;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,$atime,$mtime,$ctime,$blksize,$blocks) = CORE::stat $fh;
                close $fh;
                my $C = ($^T - $ctime) / (24*60*60);
                return wantarray ? ($C,@_) : $C;
            }
        }
    }
    return wantarray ? (undef,@_) : undef;
}

#
# UHC stacked file test $_
#
sub Char::Euhc::filetest_ {

    my $filetest = substr(pop @_, 1);

    unless (eval qq{Char::Euhc::${filetest}_}) {
        return '';
    }
    for my $filetest (CORE::reverse @_) {
        unless (eval qq{ $filetest _ }) {
            return '';
        }
    }
    return 1;
}

#
# UHC file test -r $_
#
sub Char::Euhc::r_() {

    if (-e $_) {
        return -r _ ? 1 : '';
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return -r _ ? 1 : '';
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $r = -r $fh;
                close $fh;
                return $r ? 1 : '';
            }
        }
    }

# 2010-01-26 The difference of "return;" and "return undef;" 
# http://d.hatena.ne.jp/gfx/20100126/1264474754
#
# "Perl Best Practices" recommends to use "return;"*1 to return nothing, but
# it might be wrong in some cases. If you use this idiom for those functions
# which are expected to return a scalar value, e.g. searching functions, the
# user of those functions will be surprised at what they return in list
# context, an empty list - note that many functions and all the methods
# evaluate their arguments in list context. You'd better to use "return undef;"
# for such scalar functions.
#
#     sub search_something {
#         my($arg) = @_;
#         # search_something...
#         if(defined $found){
#             return $found;
#         }
#         return; # XXX: you'd better to "return undef;"
#     }
#
#     # ...
#
#     # you'll get what you want, but ...
#     my $something = search_something($source);
#
#     # you won't get what you want here.
#     # @_ for doit() is (-foo => $opt), not (undef, -foo => $opt).
#     $obj->doit(search_something($source), -option=> $optval);
#
#     # you have to use the "scalar" operator in such a case.
#     $obj->doit(scalar search_something($source), ...);
#
# *1�Fit returns an empty list in list context, or returns undef in scalar
#     context
#
# (and so on)

    return undef;
}

#
# UHC file test -w $_
#
sub Char::Euhc::w_() {

    if (-e $_) {
        return -w _ ? 1 : '';
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return -w _ ? 1 : '';
        }
        else {
            my $fh = gensym();
            if (_open_a($fh, $_)) {
                my $w = -w $fh;
                close $fh;
                return $w ? 1 : '';
            }
        }
    }
    return undef;
}

#
# UHC file test -x $_
#
sub Char::Euhc::x_() {

    if (-e $_) {
        return -x _ ? 1 : '';
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return -x _ ? 1 : '';
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $dummy_for_underline_cache = -x $fh;
                close $fh;
            }

            # filename is not .COM .EXE .BAT .CMD
            return '';
        }
    }
    return undef;
}

#
# UHC file test -o $_
#
sub Char::Euhc::o_() {

    if (-e $_) {
        return -o _ ? 1 : '';
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return -o _ ? 1 : '';
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $o = -o $fh;
                close $fh;
                return $o ? 1 : '';
            }
        }
    }
    return undef;
}

#
# UHC file test -R $_
#
sub Char::Euhc::R_() {

    if (-e $_) {
        return -R _ ? 1 : '';
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return -R _ ? 1 : '';
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $R = -R $fh;
                close $fh;
                return $R ? 1 : '';
            }
        }
    }
    return undef;
}

#
# UHC file test -W $_
#
sub Char::Euhc::W_() {

    if (-e $_) {
        return -W _ ? 1 : '';
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return -W _ ? 1 : '';
        }
        else {
            my $fh = gensym();
            if (_open_a($fh, $_)) {
                my $W = -W $fh;
                close $fh;
                return $W ? 1 : '';
            }
        }
    }
    return undef;
}

#
# UHC file test -X $_
#
sub Char::Euhc::X_() {

    if (-e $_) {
        return -X _ ? 1 : '';
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return -X _ ? 1 : '';
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $dummy_for_underline_cache = -X $fh;
                close $fh;
            }

            # filename is not .COM .EXE .BAT .CMD
            return '';
        }
    }
    return undef;
}

#
# UHC file test -O $_
#
sub Char::Euhc::O_() {

    if (-e $_) {
        return -O _ ? 1 : '';
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return -O _ ? 1 : '';
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $O = -O $fh;
                close $fh;
                return $O ? 1 : '';
            }
        }
    }
    return undef;
}

#
# UHC file test -e $_
#
sub Char::Euhc::e_() {

    if (-e $_) {
        return 1;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return 1;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $e = -e $fh;
                close $fh;
                return $e ? 1 : '';
            }
        }
    }
    return undef;
}

#
# UHC file test -z $_
#
sub Char::Euhc::z_() {

    if (-e $_) {
        return -z _ ? 1 : '';
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return -z _ ? 1 : '';
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $z = -z $fh;
                close $fh;
                return $z ? 1 : '';
            }
        }
    }
    return undef;
}

#
# UHC file test -s $_
#
sub Char::Euhc::s_() {

    if (-e $_) {
        return -s _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return -s _;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $s = -s $fh;
                close $fh;
                return $s;
            }
        }
    }
    return undef;
}

#
# UHC file test -f $_
#
sub Char::Euhc::f_() {

    if (-e $_) {
        return -f _ ? 1 : '';
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return '';
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $f = -f $fh;
                close $fh;
                return $f ? 1 : '';
            }
        }
    }
    return undef;
}

#
# UHC file test -d $_
#
sub Char::Euhc::d_() {

    if (-e $_) {
        return -d _ ? 1 : '';
    }
    elsif (_MSWin32_5Cended_path($_)) {
        return -d "$_/." ? 1 : '';
    }
    return undef;
}

#
# UHC file test -l $_
#
sub Char::Euhc::l_() {

    if (-e $_) {
        return -l _ ? 1 : '';
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return -l _ ? 1 : '';
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $l = -l $fh;
                close $fh;
                return $l ? 1 : '';
            }
        }
    }
    return undef;
}

#
# UHC file test -p $_
#
sub Char::Euhc::p_() {

    if (-e $_) {
        return -p _ ? 1 : '';
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return -p _ ? 1 : '';
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $p = -p $fh;
                close $fh;
                return $p ? 1 : '';
            }
        }
    }
    return undef;
}

#
# UHC file test -S $_
#
sub Char::Euhc::S_() {

    if (-e $_) {
        return -S _ ? 1 : '';
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return -S _ ? 1 : '';
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $S = -S $fh;
                close $fh;
                return $S ? 1 : '';
            }
        }
    }
    return undef;
}

#
# UHC file test -b $_
#
sub Char::Euhc::b_() {

    if (-e $_) {
        return -b _ ? 1 : '';
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return -b _ ? 1 : '';
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $b = -b $fh;
                close $fh;
                return $b ? 1 : '';
            }
        }
    }
    return undef;
}

#
# UHC file test -c $_
#
sub Char::Euhc::c_() {

    if (-e $_) {
        return -c _ ? 1 : '';
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return -c _ ? 1 : '';
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $c = -c $fh;
                close $fh;
                return $c ? 1 : '';
            }
        }
    }
    return undef;
}

#
# UHC file test -u $_
#
sub Char::Euhc::u_() {

    if (-e $_) {
        return -u _ ? 1 : '';
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return -u _ ? 1 : '';
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $u = -u $fh;
                close $fh;
                return $u ? 1 : '';
            }
        }
    }
    return undef;
}

#
# UHC file test -g $_
#
sub Char::Euhc::g_() {

    if (-e $_) {
        return -g _ ? 1 : '';
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return -g _ ? 1 : '';
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my $g = -g $fh;
                close $fh;
                return $g ? 1 : '';
            }
        }
    }
    return undef;
}

#
# UHC file test -k $_
#
sub Char::Euhc::k_() {

    if ($] =~ /^5\.008/oxms) {
        return wantarray ? ('',@_) : '';
    }
    return wantarray ? ($_,@_) : $_;
}

#
# UHC file test -T $_
#
sub Char::Euhc::T_() {

    my $T = 1;

    if (-d $_ or -d "$_/.") {
        return undef;
    }
    my $fh = gensym();
    if (_open_r($fh, $_)) {
    }
    else {
        return undef;
    }

    if (sysread $fh, my $block, 512) {
        if ($block =~ /[\000\377]/oxms) {
            $T = '';
        }
        elsif (($block =~ tr/\000-\007\013\016-\032\034-\037\377//) * 10 > CORE::length $block) {
            $T = '';
        }
    }

    # 0 byte or eof
    else {
        $T = 1;
    }
    my $dummy_for_underline_cache = -T $fh;
    close $fh;

    return $T;
}

#
# UHC file test -B $_
#
sub Char::Euhc::B_() {

    my $B = '';

    if (-d $_ or -d "$_/.") {
        return undef;
    }
    my $fh = gensym();
    if (_open_r($fh, $_)) {
    }
    else {
        return undef;
    }

    if (sysread $fh, my $block, 512) {
        if ($block =~ /[\000\377]/oxms) {
            $B = 1;
        }
        elsif (($block =~ tr/\000-\007\013\016-\032\034-\037\377//) * 10 > CORE::length $block) {
            $B = 1;
        }
    }

    # 0 byte or eof
    else {
        $B = 1;
    }
    my $dummy_for_underline_cache = -B $fh;
    close $fh;

    return $B;
}

#
# UHC file test -M $_
#
sub Char::Euhc::M_() {

    if (-e $_) {
        return -M _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return -M _;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,$atime,$mtime,$ctime,$blksize,$blocks) = CORE::stat $fh;
                close $fh;
                my $M = ($^T - $mtime) / (24*60*60);
                return $M;
            }
        }
    }
    return undef;
}

#
# UHC file test -A $_
#
sub Char::Euhc::A_() {

    if (-e $_) {
        return -A _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return -A _;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,$atime,$mtime,$ctime,$blksize,$blocks) = CORE::stat $fh;
                close $fh;
                my $A = ($^T - $atime) / (24*60*60);
                return $A;
            }
        }
    }
    return undef;
}

#
# UHC file test -C $_
#
sub Char::Euhc::C_() {

    if (-e $_) {
        return -C _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        if (-d "$_/.") {
            return -C _;
        }
        else {
            my $fh = gensym();
            if (_open_r($fh, $_)) {
                my($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,$atime,$mtime,$ctime,$blksize,$blocks) = CORE::stat $fh;
                close $fh;
                my $C = ($^T - $ctime) / (24*60*60);
                return $C;
            }
        }
    }
    return undef;
}

#
# UHC path globbing (with parameter)
#
sub Char::Euhc::glob($) {

    if (wantarray) {
        my @glob = _DOS_like_glob(@_);
        for my $glob (@glob) {
            $glob =~ s{ \A (?:\./)+ }{}oxms;
        }
        return @glob;
    }
    else {
        my $glob = _DOS_like_glob(@_);
        $glob =~ s{ \A (?:\./)+ }{}oxms;
        return $glob;
    }
}

#
# UHC path globbing (without parameter)
#
sub Char::Euhc::glob_() {

    if (wantarray) {
        my @glob = _DOS_like_glob();
        for my $glob (@glob) {
            $glob =~ s{ \A (?:\./)+ }{}oxms;
        }
        return @glob;
    }
    else {
        my $glob = _DOS_like_glob();
        $glob =~ s{ \A (?:\./)+ }{}oxms;
        return $glob;
    }
}

#
# UHC path globbing from File::DosGlob module
#
# Often I confuse "_dosglob" and "_doglob".
# So, I renamed "_dosglob" to "_DOS_like_glob".
#
my %iter;
my %entries;
sub _DOS_like_glob {

    # context (keyed by second cxix argument provided by core)
    my($expr,$cxix) = @_;

    # glob without args defaults to $_
    $expr = $_ if not defined $expr;

    # represents the current user's home directory
    #
    # 7.3. Expanding Tildes in Filenames
    # in Chapter 7. File Access
    # of ISBN 0-596-00313-7 Perl Cookbook, 2nd Edition.
    #
    # and File::HomeDir, File::HomeDir::Windows module

    # DOS-like system
    if ($^O =~ /\A (?: MSWin32 | NetWare | symbian | dos ) \z/oxms) {
        $expr =~ s{ \A ~ (?= [^/\\] ) }
                  { $ENV{'HOME'} || $ENV{'USERPROFILE'} || "$ENV{'HOMEDRIVE'}$ENV{'HOMEPATH'}" }oxmse;
    }

    # UNIX-like system
    else {
        $expr =~ s{ \A ~ ( (?:[\x81-\xFE][\x00-\xFF]|[^\x81-\xFE/])* ) }
                  { $1 ? (getpwnam($1))[7] : ($ENV{'HOME'} || $ENV{'LOGDIR'} || (getpwuid($<))[7]) }oxmse;
    }

    # assume global context if not provided one
    $cxix = '_G_' if not defined $cxix;
    $iter{$cxix} = 0 if not exists $iter{$cxix};

    # if we're just beginning, do it all first
    if ($iter{$cxix} == 0) {
            $entries{$cxix} = [ _do_glob(1, _parse_line($expr)) ];
    }

    # chuck it all out, quick or slow
    if (wantarray) {
        delete $iter{$cxix};
        return @{delete $entries{$cxix}};
    }
    else {
        if ($iter{$cxix} = scalar @{$entries{$cxix}}) {
            return shift @{$entries{$cxix}};
        }
        else {
            # return undef for EOL
            delete $iter{$cxix};
            delete $entries{$cxix};
            return undef;
        }
    }
}

#
# UHC path globbing subroutine
#
sub _do_glob {

    my($cond,@expr) = @_;
    my @glob = ();
    my $fix_drive_relative_paths = 0;

OUTER:
    for my $expr (@expr) {
        next OUTER if not defined $expr;
        next OUTER if $expr eq '';

        my @matched = ();
        my @globdir = ();
        my $head    = '.';
        my $pathsep = '/';
        my $tail;

        # if argument is within quotes strip em and do no globbing
        if ($expr =~ /\A " ((?:$q_char)*) " \z/oxms) {
            $expr = $1;
            if ($cond eq 'd') {
                if (Char::Euhc::d $expr) {
                    push @glob, $expr;
                }
            }
            else {
                if (Char::Euhc::e $expr) {
                    push @glob, $expr;
                }
            }
            next OUTER;
        }

        # wildcards with a drive prefix such as h:*.pm must be changed
        # to h:./*.pm to expand correctly
        if ($^O =~ /\A (?: MSWin32 | NetWare | symbian | dos ) \z/oxms) {
            if ($expr =~ s# \A ((?:[A-Za-z]:)?) ([\x81-\xFE][\x00-\xFF]|[^\x81-\xFE/\\]) #$1./$2#oxms) {
                $fix_drive_relative_paths = 1;
            }
        }

        if (($head, $tail) = _parse_path($expr,$pathsep)) {
            if ($tail eq '') {
                push @glob, $expr;
                next OUTER;
            }
            if ($head =~ / \A (?:$q_char)*? [*?] /oxms) {
                if (@globdir = _do_glob('d', $head)) {
                    push @glob, _do_glob($cond, map {"$_$pathsep$tail"} @globdir);
                    next OUTER;
                }
            }
            if ($head eq '' or $head =~ /\A [A-Za-z]: \z/oxms) {
                $head .= $pathsep;
            }
            $expr = $tail;
        }

        # If file component has no wildcards, we can avoid opendir
        if ($expr !~ / \A (?:$q_char)*? [*?] /oxms) {
            if ($head eq '.') {
                $head = '';
            }
            if ($head ne '' and ($head =~ / \G ($q_char) /oxmsg)[-1] ne $pathsep) {
                $head .= $pathsep;
            }
            $head .= $expr;
            if ($cond eq 'd') {
                if (Char::Euhc::d $head) {
                    push @glob, $head;
                }
            }
            else {
                if (Char::Euhc::e $head) {
                    push @glob, $head;
                }
            }
            next OUTER;
        }
        Char::Euhc::opendir(*DIR, $head) or next OUTER;
        my @leaf = readdir DIR;
        closedir DIR;

        if ($head eq '.') {
            $head = '';
        }
        if ($head ne '' and ($head =~ / \G ($q_char) /oxmsg)[-1] ne $pathsep) {
            $head .= $pathsep;
        }

        my $pattern = '';
        while ($expr =~ / \G ($q_char) /oxgc) {
            my $char = $1;
            if ($char eq '*') {
                $pattern .= "(?:$your_char)*",
            }
            elsif ($char eq '?') {
                $pattern .= "(?:$your_char)?",  # DOS style
#               $pattern .= "(?:$your_char)",   # UNIX style
            }
            elsif ((my $fc = Char::Euhc::fc($char)) ne $char) {
                $pattern .= $fc;
            }
            else {
                $pattern .= quotemeta $char;
            }
        }
        my $matchsub = sub { Char::Euhc::fc($_[0]) =~ /\A $pattern \z/xms };

#       if ($@) {
#           print STDERR "$0: $@\n";
#           next OUTER;
#       }

INNER:
        for my $leaf (@leaf) {
            if ($leaf eq '.' or $leaf eq '..') {
                next INNER;
            }
            if ($cond eq 'd' and not Char::Euhc::d "$head$leaf") {
                next INNER;
            }

            if (&$matchsub($leaf)) {
                push @matched, "$head$leaf";
                next INNER;
            }

            # [DOS compatibility special case]
            # Failed, add a trailing dot and try again, but only...

            if (Char::Euhc::index($leaf,'.') == -1 and   # if name does not have a dot in it *and*
                CORE::length($leaf) <= 8 and        # name is shorter than or equal to 8 chars *and*
                Char::Euhc::index($pattern,'\\.') != -1  # pattern has a dot.
            ) {
                if (&$matchsub("$leaf.")) {
                    push @matched, "$head$leaf";
                    next INNER;
                }
            }
        }
        if (@matched) {
            push @glob, @matched;
        }
    }
    if ($fix_drive_relative_paths) {
        for my $glob (@glob) {
            $glob =~ s# \A ([A-Za-z]:) \./ #$1#oxms;
        }
    }
    return @glob;
}

#
# UHC parse line
#
sub _parse_line {

    my($line) = @_;

    $line .= ' ';
    my @piece = ();
    while ($line =~ /
        " ( (?: [\x81-\xFE][\x00-\xFF]|[^\x81-\xFE"]   )*  ) " \s+ |
          ( (?: [\x81-\xFE][\x00-\xFF]|[^\x81-\xFE"\s] )*  )   \s+
        /oxmsg
    ) {
        push @piece, defined($1) ? $1 : $2;
    }
    return @piece;
}

#
# UHC parse path
#
sub _parse_path {

    my($path,$pathsep) = @_;

    $path .= '/';
    my @subpath = ();
    while ($path =~ /
        ((?: [\x81-\xFE][\x00-\xFF]|[^\x81-\xFE\/\\] )+?) [\/\\]
        /oxmsg
    ) {
        push @subpath, $1;
    }

    my $tail = pop @subpath;
    my $head = join $pathsep, @subpath;
    return $head, $tail;
}

#
# UHC file lstat (with parameter)
#
sub Char::Euhc::lstat(*) {

    local $_ = shift if @_;

    if (-e $_) {
        return CORE::lstat _;
    }
    elsif (_MSWin32_5Cended_path($_)) {

        # Even if ${^WIN32_SLOPPY_STAT} is set to a true value, Char::Euhc::lstat()
        # on Windows opens the file for the path which has 5c at end.
        # (and so on)

        my $fh = gensym();
        if (wantarray) {
            if (_open_r($fh, $_)) {
                my @lstat = CORE::stat $fh; # not CORE::lstat
                close $fh;
                return @lstat;
            }
        }
        else {
            if (_open_r($fh, $_)) {
                my $lstat = CORE::stat $fh; # not CORE::lstat
                close $fh;
                return $lstat;
            }
        }
    }
    return wantarray ? () : undef;
}

#
# UHC file lstat (without parameter)
#
sub Char::Euhc::lstat_() {

    if (-e $_) {
        return CORE::lstat _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        my $fh = gensym();
        if (wantarray) {
            if (_open_r($fh, $_)) {
                my @lstat = CORE::stat $fh; # not CORE::lstat
                close $fh;
                return @lstat;
            }
        }
        else {
            if (_open_r($fh, $_)) {
                my $lstat = CORE::stat $fh; # not CORE::lstat
                close $fh;
                return $lstat;
            }
        }
    }
    return wantarray ? () : undef;
}

#
# UHC path opendir
#
sub Char::Euhc::opendir(*$) {

    my $dh = qualify_to_ref $_[0];
    if (CORE::opendir $dh, $_[1]) {
        return 1;
    }
    elsif (_MSWin32_5Cended_path($_[1])) {
        if (CORE::opendir $dh, "$_[1]/.") {
            return 1;
        }
    }
    return undef;
}

#
# UHC file stat (with parameter)
#
sub Char::Euhc::stat(*) {

    local $_ = shift if @_;

    my $fh = qualify_to_ref $_;
    if (defined fileno $fh) {
        return CORE::stat $fh;
    }
    elsif (-e $_) {
        return CORE::stat _;
    }
    elsif (_MSWin32_5Cended_path($_)) {

        # Even if ${^WIN32_SLOPPY_STAT} is set to a true value, Char::Euhc::stat()
        # on Windows opens the file for the path which has 5c at end.
        # (and so on)

        my $fh = gensym();
        if (wantarray) {
            if (_open_r($fh, $_)) {
                my @stat = CORE::stat $fh;
                close $fh;
                return @stat;
            }
        }
        else {
            if (_open_r($fh, $_)) {
                my $stat = CORE::stat $fh;
                close $fh;
                return $stat;
            }
        }
    }
    return wantarray ? () : undef;
}

#
# UHC file stat (without parameter)
#
sub Char::Euhc::stat_() {

    my $fh = qualify_to_ref $_;
    if (defined fileno $fh) {
        return CORE::stat $fh;
    }
    elsif (-e $_) {
        return CORE::stat _;
    }
    elsif (_MSWin32_5Cended_path($_)) {
        my $fh = gensym();
        if (wantarray) {
            if (_open_r($fh, $_)) {
                my @stat = CORE::stat $fh;
                close $fh;
                return @stat;
            }
        }
        else {
            if (_open_r($fh, $_)) {
                my $stat = CORE::stat $fh;
                close $fh;
                return $stat;
            }
        }
    }
    return wantarray ? () : undef;
}

#
# UHC path unlink
#
sub Char::Euhc::unlink(@) {

    local @_ = ($_) unless @_;

    my $unlink = 0;
    for (@_) {
        if (CORE::unlink) {
            $unlink++;
        }
        elsif (Char::Euhc::d($_)) {
        }
        elsif (_MSWin32_5Cended_path($_)) {
            my @char = /\G ($q_char) /oxmsg;
            my $file = join '', map {{'/' => '\\'}->{$_} || $_} @char;
            if ($file =~ / \A (?:$q_char)*? [ ] /oxms) {
                $file = qq{"$file"};
            }

            # internal command 'del' of command.com or cmd.exe
            if ($ENV{'COMSPEC'} =~ / \\COMMAND\.COM \z/oxmsi) {
                CORE::system 'del', $file;
            }
            else {
                CORE::system 'del', $file, '2>NUL';
            }

            my $fh = gensym();
            if (_open_r($fh, $_)) {
                close $fh;
            }
            else {
                $unlink++;
            }
        }
    }
    return $unlink;
}

#
# UHC chdir
#
sub Char::Euhc::chdir(;$) {

    if (@_ == 0) {
        return CORE::chdir;
    }

    my($dir) = @_;

    if (_MSWin32_5Cended_path($dir)) {
        if (not Char::Euhc::d $dir) {
            return 0;
        }

        if ($] =~ /^5\.005/oxms) {
            return CORE::chdir $dir;
        }
        elsif (($] =~ /^(?:5\.006|5\.008000)/oxms) and ($^O eq 'MSWin32')) {
            local $@;
            my $chdir = eval q{
                CORE::require 'jacode.pl';

                # P.676 ${^WIDE_SYSTEM_CALLS}
                # in Chapter 28: Special Names
                # of ISBN 0-596-00027-8 Programming Perl Third Edition.

                # P.790 ${^WIDE_SYSTEM_CALLS}
                # in Chapter 25: Special Names
                # of ISBN 978-0-596-00492-7 Programming Perl 4th Edition.

                local ${^WIDE_SYSTEM_CALLS} = 1;
                return CORE::chdir jcode::utf8($dir,'sjis');
            };
            if (not $@) {
                return $chdir;
            }
            else {
                return 0;
            }
        }

        local $@;
        my $shortdir = '';
        my $chdir = eval q{
            use Win32;
            $shortdir = Win32::GetShortPathName($dir);
            if ($shortdir ne $dir) {
                return CORE::chdir $shortdir;
            }
            else {
                return 0;
            }
        };
        if ($@) {
            my @char = $dir =~ /\G ($q_char) /oxmsg;
            while ($char[-1] eq "\x5C") {
                pop @char;
            }
            $dir = join '', @char;
            croak "Perl$] can't chdir to $dir (chr(0x5C) ended path), Win32.pm module may help you";
        }
        elsif ($shortdir eq $dir) {
            my @char = $dir =~ /\G ($q_char) /oxmsg;
            while ($char[-1] eq "\x5C") {
                pop @char;
            }
            $dir = join '', @char;
            croak "Perl$] can't chdir to $dir (chr(0x5C) ended path)";
        }
        return $chdir;
    }
    else {
        return CORE::chdir $dir;
    }
}

#
# UHC chr(0x5C) ended path on MSWin32
#
sub _MSWin32_5Cended_path {

    if ((@_ >= 1) and ($_[0] ne '')) {
        if ($^O =~ /\A (?: MSWin32 | NetWare | symbian | dos ) \z/oxms) {
            my @char = $_[0] =~ /\G ($q_char) /oxmsg;
            if ($char[-1] =~ / \x5C \z/oxms) {
                return 1;
            }
        }
    }
    return undef;
}

#
# do UHC file
#
sub Char::Euhc::do($) {

    my($filename) = @_;

    my $realfilename;
    my $result;
ITER_DO:
    {
        for my $prefix (@INC) {
            if ($^O eq 'MacOS') {
                $realfilename = "$prefix$filename";
            }
            else {
                $realfilename = "$prefix/$filename";
            }

            if (Char::Euhc::f($realfilename)) {

                my $script = '';

                if (Char::Euhc::e("$realfilename.e")) {
                    my $e_mtime      = (Char::Euhc::stat("$realfilename.e"))[9];
                    my $mtime        = (Char::Euhc::stat($realfilename))[9];
                    my $module_mtime = (Char::Euhc::stat(__FILE__))[9];
                    if (($e_mtime < $mtime) or ($mtime < $module_mtime)) {
                        Char::Euhc::unlink "$realfilename.e";
                    }
                }

                if (Char::Euhc::e("$realfilename.e")) {
                    my $fh = gensym();
                    if (_open_a($fh, "$realfilename.e")) {
                        if ($^O eq 'MacOS') {
                            eval q{
                                CORE::require Mac::Files;
                                Mac::Files::FSpSetFLock("$realfilename.e");
                            };
                        }
                        elsif (exists $ENV{'SJIS_NONBLOCK'}) {

                            # P.419 File Locking
                            # in Chapter 16: Interprocess Communication
                            # of ISBN 0-596-00027-8 Programming Perl Third Edition.

                            # P.524 File Locking
                            # in Chapter 15: Interprocess Communication
                            # of ISBN 978-0-596-00492-7 Programming Perl 4th Edition.

                            # (and so on)

                            eval q{
                                unless (flock($fh, LOCK_SH | LOCK_NB)) {
                                    carp "Can't immediately read-lock the file: $realfilename.e";
                                    exit;
                                }
                            };
                        }
                        else {
                            eval q{ flock($fh, LOCK_SH) };
                        }
                        local $/ = undef; # slurp mode
                        $script = <$fh>;
                        if ($^O eq 'MacOS') {
                            eval q{
                                CORE::require Mac::Files;
                                Mac::Files::FSpRstFLock("$realfilename.e");
                            };
                        }
                        close $fh;
                    }
                }
                else {
                    my $fh = gensym();
                    _open_r($fh, $realfilename);
                    local $/ = undef; # slurp mode
                    $script = <$fh>;
                    close $fh;

                    if ($script =~ /^ \s* use \s+ Char::UHC \s* ([^\x81-\xFE;]*) ; \s* \n? $/oxms) {
                        CORE::require Char::UHC;
                        $script = Char::UHC::escape_script($script);
                        my $fh = gensym();
                        if ((eval q{ use Fcntl qw(O_WRONLY O_APPEND O_CREAT); 1 } and CORE::sysopen($fh, "$realfilename.e", &O_WRONLY|&O_APPEND|&O_CREAT)) or
                            _open_a($fh, "$realfilename.e")
                        ) {
                            if ($^O eq 'MacOS') {
                                eval q{
                                    CORE::require Mac::Files;
                                    Mac::Files::FSpSetFLock("$realfilename.e");
                                };
                            }
                            elsif (exists $ENV{'SJIS_NONBLOCK'}) {
                                eval q{
                                    unless (flock($fh, LOCK_EX | LOCK_NB)) {
                                        carp "Can't immediately write-lock the file: $realfilename.e";
                                        exit;
                                    }
                                };
                            }
                            else {
                                eval q{ flock($fh, LOCK_EX) };
                            }
                            truncate($fh, 0) or croak "Can't truncate file: $realfilename.e";
                            seek($fh, 0, 0)  or croak "Can't seek file: $realfilename.e";
                            print {$fh} $script;
                            if ($^O eq 'MacOS') {
                                eval q{
                                    CORE::require Mac::Files;
                                    Mac::Files::FSpRstFLock("$realfilename.e");
                                };
                            }
                            close $fh;
                        }
                    }
                }

                if (eval { local $@; CORE::require strict }) {
                    strict::->unimport;
                }
                $result = scalar eval $script;

                last ITER_DO;
            }
        }
    }

    if ($@) {
        $INC{$filename} = undef;
        return undef;
    }
    elsif (not $result) {
        return undef;
    }
    else {
        $INC{$filename} = $realfilename;
        return $result;
    }
}

#
# require UHC file
#

# require
# in Chapter 3: Functions
# of ISBN 1-56592-149-6 Programming Perl, Second Edition.
#
# sub require {
#     my($filename) = @_;
#     return 1 if $INC{$filename};
#     my($realfilename, $result);
#     ITER: {
#         foreach $prefix (@INC) {
#             $realfilename = "$prefix/$filename";
#             if (-f $realfilename) {
#                 $result = eval `cat $realfilename`;
#                 last ITER;
#             }
#         }
#         die "Can't find $filename in \@INC";
#     }
#     die $@ if $@;
#     die "$filename did not return true value" unless $result;
#     $INC{$filename} = $realfilename;
#     return $result;
# }

# require
# in Chapter 9: perlfunc: Perl builtin functions
# of ISBN-13: 978-1-906966-02-7 The Perl Language Reference Manual (for Perl version 5.12.1)
#
# sub require {
#     my($filename) = @_;
#     if (exists $INC{$filename}) {
#         return 1 if $INC{$filename};
#         die "Compilation failed in require";
#     }
#     my($realfilename, $result);
#     ITER: {
#         foreach $prefix (@INC) {
#             $realfilename = "$prefix/$filename";
#             if (-f $realfilename) {
#                 $INC{$filename} = $realfilename;
#                 $result = do $realfilename;
#                 last ITER;
#             }
#         }
#         die "Can't find $filename in \@INC";
#     }
#     if ($@) {
#         $INC{$filename} = undef;
#         die $@;
#     }
#     elsif (!$result) {
#         delete $INC{$filename};
#         die "$filename did not return true value";
#     }
#     else {
#         return $result;
#     }
# }

sub Char::Euhc::require(;$) {

    local $_ = shift if @_;

    if (exists $INC{$_}) {
        return 1 if $INC{$_};
        croak "Compilation failed in require: $_";
    }

    # jcode.pl
    # ftp://ftp.iij.ad.jp/pub/IIJ/dist/utashiro/perl/

    # jacode.pl
    # http://search.cpan.org/dist/jacode/

    if (/ \b (?: jcode\.pl | jacode\.pl ) \z /oxms) {
        return CORE::require($_);
    }

    my $realfilename;
    my $result;
ITER_REQUIRE:
    {
        for my $prefix (@INC) {
            if ($^O eq 'MacOS') {
                $realfilename = "$prefix$_";
            }
            else {
                $realfilename = "$prefix/$_";
            }

            if (Char::Euhc::f($realfilename)) {
                $INC{$_} = $realfilename;

                my $script = '';

                if (Char::Euhc::e("$realfilename.e")) {
                    my $e_mtime      = (Char::Euhc::stat("$realfilename.e"))[9];
                    my $mtime        = (Char::Euhc::stat($realfilename))[9];
                    my $module_mtime = (Char::Euhc::stat(__FILE__))[9];
                    if (($e_mtime < $mtime) or ($mtime < $module_mtime)) {
                        Char::Euhc::unlink "$realfilename.e";
                    }
                }

                if (Char::Euhc::e("$realfilename.e")) {
                    my $fh = gensym();
                    _open_r($fh, "$realfilename.e") or croak "Can't open file: $realfilename.e";
                    if ($^O eq 'MacOS') {
                        eval q{
                            CORE::require Mac::Files;
                            Mac::Files::FSpSetFLock("$realfilename.e");
                        };
                    }
                    elsif (exists $ENV{'SJIS_NONBLOCK'}) {
                        eval q{
                            unless (flock($fh, LOCK_SH | LOCK_NB)) {
                                carp "Can't immediately read-lock the file: $realfilename.e";
                                exit;
                            }
                        };
                    }
                    else {
                        eval q{ flock($fh, LOCK_SH) };
                    }
                    local $/ = undef; # slurp mode
                    $script = <$fh>;
                    if ($^O eq 'MacOS') {
                        eval q{
                            CORE::require Mac::Files;
                            Mac::Files::FSpRstFLock("$realfilename.e");
                        };
                    }
                    close($fh) or croak "Can't close file: $realfilename";
                }
                else {
                    my $fh = gensym();
                    _open_r($fh, $realfilename) or croak "Can't open file: $realfilename";
                    local $/ = undef; # slurp mode
                    $script = <$fh>;
                    close($fh) or croak "Can't close file: $realfilename";

                    if ($script =~ /^ \s* use \s+ Char::UHC \s* ([^\x81-\xFE;]*) ; \s* \n? $/oxms) {
                        CORE::require Char::UHC;
                        $script = Char::UHC::escape_script($script);
                        my $fh = gensym();
                        if (eval q{ use Fcntl qw(O_WRONLY O_APPEND O_CREAT); 1 } and CORE::sysopen($fh,"$realfilename.e",&O_WRONLY|&O_APPEND|&O_CREAT)) {
                        }
                        else {
                            _open_a($fh, "$realfilename.e") or croak "Can't write open file: $realfilename.e";
                        }
                        if ($^O eq 'MacOS') {
                            eval q{
                                CORE::require Mac::Files;
                                Mac::Files::FSpSetFLock("$realfilename.e");
                            };
                        }
                        elsif (exists $ENV{'SJIS_NONBLOCK'}) {
                            eval q{
                                unless (flock($fh, LOCK_EX | LOCK_NB)) {
                                    carp "Can't immediately write-lock the file: $realfilename.e";
                                    exit;
                                }
                            };
                        }
                        else {
                            eval q{ flock($fh, LOCK_EX) };
                        }
                        truncate($fh, 0) or croak "Can't truncate file: $realfilename.e";
                        seek($fh, 0, 0)  or croak "Can't seek file: $realfilename.e";
                        print {$fh} $script;
                        if ($^O eq 'MacOS') {
                            eval q{
                                CORE::require Mac::Files;
                                Mac::Files::FSpRstFLock("$realfilename.e");
                            };
                        }
                        close($fh) or croak "Can't close file: $realfilename";
                    }
                }

                if (eval { local $@; CORE::require strict }) {
                    strict::->unimport;
                }
                $result = scalar eval $script;

                last ITER_REQUIRE;
            }
        }
        croak "Can't find $_ in \@INC";
    }

    if ($@) {
        $INC{$_} = undef;
        croak $@;
    }
    elsif (not $result) {
        delete $INC{$_};
        croak "$_ did not return true value";
    }
    else {
        return $result;
    }
}

#
# UHC telldir avoid warning
#
sub Char::Euhc::telldir(*) {

    local $^W = 0;

    return CORE::telldir $_[0];
}

#
# ${^PREMATCH}, $PREMATCH, $` the string preceding what was matched
#
sub Char::Euhc::PREMATCH {
    if (defined($&)) {
        if (defined($1) and (CORE::substr($&,-CORE::length($1),CORE::length($1)) eq $1)) {
            return CORE::substr($&,0,CORE::length($&)-CORE::length($1));
        }
        else {
            croak 'Use of "$`", $PREMATCH and ${^PREMATCH} need to /( capture all )/ in regexp';
        }
    }
    else {
        return '';
    }
    return $`;
}

#
# ${^MATCH}, $MATCH, $& the string that matched
#
sub Char::Euhc::MATCH {
    if (defined($&)) {
        if (defined($1)) {
            return $1;
        }
        else {
            croak 'Use of "$&", $MATCH and ${^MATCH} need to /( capture all )/ in regexp';
        }
    }
    else {
        return '';
    }
    return $&;
}

#
# ${^POSTMATCH}, $POSTMATCH, $' the string following what was matched
#
sub Char::Euhc::POSTMATCH {
    return $';
}

#
# UHC character to order (with parameter)
#
sub Char::UHC::ord(;$) {

    local $_ = shift if @_;

    if (/\A ($q_char) /oxms) {
        my @ord = unpack 'C*', $1;
        my $ord = 0;
        while (my $o = shift @ord) {
            $ord = $ord * 0x100 + $o;
        }
        return $ord;
    }
    else {
        return CORE::ord $_;
    }
}

#
# UHC character to order (without parameter)
#
sub Char::UHC::ord_() {

    if (/\A ($q_char) /oxms) {
        my @ord = unpack 'C*', $1;
        my $ord = 0;
        while (my $o = shift @ord) {
            $ord = $ord * 0x100 + $o;
        }
        return $ord;
    }
    else {
        return CORE::ord $_;
    }
}

#
# UHC reverse
#
sub Char::UHC::reverse(@) {

    if (wantarray) {
        return CORE::reverse @_;
    }
    else {

        # One of us once cornered Larry in an elevator and asked him what
        # problem he was solving with this, but he looked as far off into
        # the distance as he could in an elevator and said, "It seemed like
        # a good idea at the time."

        return join '', CORE::reverse(join('',@_) =~ /\G ($q_char) /oxmsg);
    }
}

#
# UHC getc (with parameter, without parameter)
#
sub Char::UHC::getc(;*@) {

    my($package) = caller;
    my $fh = @_ ? qualify_to_ref(shift,$package) : \*STDIN;
    croak 'Too many arguments for Char::UHC::getc' if @_ and not wantarray;

    my @length = sort { $a <=> $b } keys %range_tr;
    my $getc = '';
    for my $length ($length[0] .. $length[-1]) {
        $getc .= CORE::getc($fh);
        if (exists $range_tr{CORE::length($getc)}) {
            if ($getc =~ /\A ${Char::Euhc::dot_s} \z/oxms) {
                return wantarray ? ($getc,@_) : $getc;
            }
        }
    }
    return wantarray ? ($getc,@_) : $getc;
}

#
# UHC length by character
#
sub Char::UHC::length(;$) {

    local $_ = shift if @_;

    local @_ = /\G ($q_char) /oxmsg;
    return scalar @_;
}

#
# UHC substr by character
#
sub Char::UHC::substr($$;$$) {

    my @char = $_[0] =~ /\G ($q_char) /oxmsg;

    # substr($string,$offset,$length,$replacement)
    if (@_ == 4) {
        my(undef,$offset,$length,$replacement) = @_;
        my $substr = join '', splice(@char, $offset, $length, $replacement);
        $_[0] = join '', @char;
        return $substr;
    }

    # substr($string,$offset,$length)
    elsif (@_ == 3) {
        my(undef,$offset,$length) = @_;
        if ($length == 0) {
            return '';
        }
        if ($offset >= 0) {
            return join '', (@char[$offset            .. $#char])[0 .. $length-1];
        }
        else {
            return join '', (@char[($#char+$offset+1) .. $#char])[0 .. $length-1];
        }
    }

    # substr($string,$offset)
    else {
        my(undef,$offset) = @_;
        if ($offset >= 0) {
            return join '', @char[$offset            .. $#char];
        }
        else {
            return join '', @char[($#char+$offset+1) .. $#char];
        }
    }
}

#
# UHC index by character
#
sub Char::UHC::index($$;$) {

    my $index;
    if (@_ == 3) {
        $index = Char::Euhc::index($_[0], $_[1], CORE::length(Char::UHC::substr($_[0], 0, $_[2])));
    }
    else {
        $index = Char::Euhc::index($_[0], $_[1]);
    }

    if ($index == -1) {
        return -1;
    }
    else {
        return Char::UHC::length(CORE::substr $_[0], 0, $index);
    }
}

#
# UHC rindex by character
#
sub Char::UHC::rindex($$;$) {

    my $rindex;
    if (@_ == 3) {
        $rindex = Char::Euhc::rindex($_[0], $_[1], CORE::length(Char::UHC::substr($_[0], 0, $_[2])));
    }
    else {
        $rindex = Char::Euhc::rindex($_[0], $_[1]);
    }

    if ($rindex == -1) {
        return -1;
    }
    else {
        return Char::UHC::length(CORE::substr $_[0], 0, $rindex);
    }
}

#
# instead of Carp::carp
#
sub carp {
    my($package,$filename,$line) = caller(1);
    print STDERR "@_ at $filename line $line.\n";
}

#
# instead of Carp::croak
#
sub croak {
    my($package,$filename,$line) = caller(1);
    print STDERR "@_ at $filename line $line.\n";
    die "\n";
}

#
# instead of Carp::cluck
#
sub cluck {
    my $i = 0;
    my @cluck = ();
    while (my($package,$filename,$line,$subroutine) = caller($i)) {
        push @cluck, "[$i] $filename($line) $package::$subroutine\n";
        $i++;
    }
    print STDERR CORE::reverse @cluck;
    print STDERR "\n";
    carp @_;
}

#
# instead of Carp::confess
#
sub confess {
    my $i = 0;
    my @confess = ();
    while (my($package,$filename,$line,$subroutine) = caller($i)) {
        push @confess, "[$i] $filename($line) $package::$subroutine\n";
        $i++;
    }
    print STDERR CORE::reverse @confess;
    print STDERR "\n";
    croak @_;
}

1;

__END__

=pod

=head1 NAME

Char::Euhc - Run-time routines for Char/UHC.pm

=head1 SYNOPSIS

  use Char::Euhc;

    Char::Euhc::split(...);
    Char::Euhc::tr(...);
    Char::Euhc::chop(...);
    Char::Euhc::index(...);
    Char::Euhc::rindex(...);
    Char::Euhc::lc(...);
    Char::Euhc::lc_;
    Char::Euhc::lcfirst(...);
    Char::Euhc::lcfirst_;
    Char::Euhc::uc(...);
    Char::Euhc::uc_;
    Char::Euhc::ucfirst(...);
    Char::Euhc::ucfirst_;
    Char::Euhc::fc(...);
    Char::Euhc::fc_;
    Char::Euhc::ignorecase(...);
    Char::Euhc::capture(...);
    Char::Euhc::chr(...);
    Char::Euhc::chr_;
    Char::Euhc::X ...;
    Char::Euhc::X_;
    Char::Euhc::glob(...);
    Char::Euhc::glob_;
    Char::Euhc::lstat(...);
    Char::Euhc::lstat_;
    Char::Euhc::opendir(...);
    Char::Euhc::stat(...);
    Char::Euhc::stat_;
    Char::Euhc::unlink(...);
    Char::Euhc::chdir(...);
    Char::Euhc::do(...);
    Char::Euhc::require(...);
    Char::Euhc::telldir(...);

  # "no Char::Euhc;" not supported

=head1 ABSTRACT

This module is a run-time routines of the Char/UHC.pm.
Because the Char/UHC.pm automatically uses this module, you need not use directly.

=head1 BUGS AND LIMITATIONS

I have tested and verified this software using the best of my ability.
However, a software containing much regular expression is bound to contain
some bugs. Thus, if you happen to find a bug that's in Char::UHC software and not
your own program, you can try to reduce it to a minimal test case and then
report it to the following author's address. If you have an idea that could
make this a more useful tool, please let everyone share it.

=head1 HISTORY

This Char::Euhc module first appeared in ActivePerl Build 522 Built under
MSWin32 Compiled at Nov 2 1999 09:52:28

=head1 AUTHOR

INABA Hitoshi E<lt>ina@cpan.orgE<gt>

This project was originated by INABA Hitoshi.
For any questions, use E<lt>ina@cpan.orgE<gt> so we can share
this file.

=head1 LICENSE AND COPYRIGHT

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

=head1 EXAMPLES

=over 2

=item Split string

  @split = Char::Euhc::split(/pattern/,$string,$limit);
  @split = Char::Euhc::split(/pattern/,$string);
  @split = Char::Euhc::split(/pattern/);
  @split = Char::Euhc::split('',$string,$limit);
  @split = Char::Euhc::split('',$string);
  @split = Char::Euhc::split('');
  @split = Char::Euhc::split();
  @split = Char::Euhc::split;

  This function scans a string given by $string for separators, and splits the
  string into a list of substring, returning the resulting list value in list
  context or the count of substring in scalar context. Scalar context also causes
  split to write its result to @_, but this usage is deprecated. The separators
  are determined by repeated pattern matching, using the regular expression given
  in /pattern/, so the separators may be of any size and need not be the same
  string on every match. (The separators are not ordinarily returned; exceptions
  are discussed later in this section.) If the /pattern/ doesn't match the string
  at all, Char::Euhc::split returns the original string as a single substring, If it
  matches once, you get two substrings, and so on. You may supply regular
  expression modifiers to the /pattern/, like /pattern/i, /pattern/x, etc. The
  //m modifier is assumed when you split on the pattern /^/.

  If $limit is specified and positive, the function splits into no more than that
  many fields (though it may split into fewer if it runs out of separators). If
  $limit is negative, it is treated as if an arbitrarily large $limit has been
  specified If $limit is omitted or zero, trailing null fields are stripped from
  the result (which potential users of pop would do wel to remember). If $string
  is omitted, the function splits the $_ string. If /pattern/ is also omitted or
  is the literal space, " ", the function split on whitespace, /\s+/, after
  skipping any leading whitespace.

  A /pattern/ of /^/ is secretly treated if it it were /^/m, since it isn't much
  use otherwise.

  String of any length can be split:

  @chars  = Char::Euhc::split(//,  $word);
  @fields = Char::Euhc::split(/:/, $line);
  @words  = Char::Euhc::split(" ", $paragraph);
  @lines  = Char::Euhc::split(/^/, $buffer);

  A pattern capable of matching either the null string or something longer than
  the null string (for instance, a pattern consisting of any single character
  modified by a * or ?) will split the value of $string into separate characters
  wherever it matches the null string between characters; nonnull matches will
  skip over the matched separator characters in the usual fashion. (In other words,
  a pattern won't match in one spot more than once, even if it matched with a zero
  width.) For example:

  print join(":" => Char::Euhc::split(/ */, "hi there"));

  produces the output "h:i:t:h:e:r:e". The space disappers because it matches
  as part of the separator. As a trivial case, the null pattern // simply splits
  into separate characters, and spaces do not disappear. (For normal pattern
  matches, a // pattern would repeat the last successfully matched pattern, but
  Char::Euhc::split's pattern is exempt from that wrinkle.)

  The $limit parameter splits only part of a string:

  my ($login, $passwd, $remainder) = Char::Euhc::split(/:/, $_, 3);

  We encourage you to split to lists of names like this to make your code
  self-documenting. (For purposes of error checking, note that $remainder would
  be undefined if there were fewer than three fields.) When assigning to a list,
  if $limit is omitted, Perl supplies a $limit one larger than the number of
  variables in the list, to avoid unneccessary work. For the split above, $limit
  would have been 4 by default, and $remainder would have received only the third
  field, not all the rest of the fields. In time-critical applications, it behooves
  you not to split into more fields than you really need. (The trouble with
  powerful languages it that they let you be powerfully stupid at times.)

  We said earlier that the separators are not returned, but if the /pattern/
  contains parentheses, then the substring matched by each pair of parentheses is
  included in the resulting list, interspersed with the fields that are ordinarily
  returned. Here's a simple example:

  Char::Euhc::split(/([-,])/, "1-10,20");

  which produces the list value:

  (1, "-", 10, ",", 20)

  With more parentheses, a field is returned for each pair, even if some pairs
  don't match, in which case undefined values are returned in those positions. So
  if you say:

  Char::Euhc::split(/(-)|(,)/, "1-10,20");

  you get the value:

  (1, "-", undef, 10, undef, ",", 20)

  The /pattern/ argument may be replaced with an expression to specify patterns
  that vary at runtime. As with ordinary patterns, to do run-time compilation only
  once, use /$variable/o.

  As a special case, if the expression is a single space (" "), the function
  splits on whitespace just as Char::Euhc::split with no arguments does. Thus,
  Char::Euhc::split(" ") can be used to emulate awk's default behavior. In contrast,
  Char::Euhc::split(/ /) will give you as many null initial fields as there are
  leading spaces. (Other than this special case, if you supply a string instead
  of a regular expression, it'll be interpreted as a regular expression anyway.)
  You can use this property to remove leading and trailing whitespace from a
  string and to collapse intervaning stretches of whitespace into a single
  space:

  $string = join(" ", Char::Euhc::split(" ", $string));

  The following example splits an RFC822 message header into a hash containing
  $head{'Date'}, $head{'Subject'}, and so on. It uses the trick of assigning a
  list of pairs to a hash, because separators altinate with separated fields, It
  users parentheses to return part of each separator as part of the returned list
  value. Since the split pattern is guaranteed to return things in pairs by virtue
  of containing one set of parentheses, the hash assignment is guaranteed to
  receive a list consisting of key/value pairs, where each key is the name of a
  header field. (Unfortunately, this technique loses information for multiple lines
  with the same key field, such as Received-By lines. Ah well)

  $header =~ s/\n\s+/ /g; # Merge continuation lines.
  %head = ("FRONTSTUFF", Char::Euhc::split(/^(\S*?):\s*/m, $header));

  The following example processes the entries in a Unix passwd(5) file. You could
  leave out the chomp, in which case $shell would have a newline on the end of it.

  open(PASSWD, "/etc/passwd");
  while (<PASSWD>) {
      chomp; # remove trailing newline.
      ($login, $passwd, $uid, $gid, $gcos, $home, $shell) =
          Char::Euhc::split(/:/);
      ...
  }

  Here's how process each word of each line of each file of input to create a
  word-frequency hash.

  while (<>) {
      for my $word (Char::Euhc::split()) {
          $count{$word}++;
      }
  }

  The inverse of Char::Euhc::split is join, except that join can only join with the
  same separator between all fields. To break apart a string with fixed-position
  fields, use unpack.

=item Transliteration

  $tr = Char::Euhc::tr($variable,$bind_operator,$searchlist,$replacementlist,$modifier);
  $tr = Char::Euhc::tr($variable,$bind_operator,$searchlist,$replacementlist);

  This is the transliteration (sometimes erroneously called translation) operator,
  which is like the y/// operator in the Unix sed program, only better, in
  everybody's humble opinion.

  This function scans a UHC string character by character and replaces all
  occurrences of the characters found in $searchlist with the corresponding character
  in $replacementlist. It returns the number of characters replaced or deleted.
  If no UHC string is specified via =~ operator, the $_ variable is translated.
  $modifier are:

  ---------------------------------------------------------------------------
  Modifier   Meaning
  ---------------------------------------------------------------------------
  c          Complement $searchlist.
  d          Delete found but unreplaced characters.
  s          Squash duplicate replaced characters.
  r          Return transliteration and leave the original string untouched.
  ---------------------------------------------------------------------------

  To use with a read-only value without raising an exception, use the /r modifier.

  print Char::Euhc::tr('bookkeeper','=~','boep','peob','r'); # prints 'peekkoobor'

=item Chop string

  $chop = Char::Euhc::chop(@list);
  $chop = Char::Euhc::chop();
  $chop = Char::Euhc::chop;

  This function chops off the last character of a string variable and returns the
  character chopped. The Char::Euhc::chop function is used primary to remove the newline
  from the end of an input recoed, and it is more efficient than using a
  substitution. If that's all you're doing, then it would be safer to use chomp,
  since Char::Euhc::chop always shortens the string no matter what's there, and chomp
  is more selective. If no argument is given, the function chops the $_ variable.

  You cannot Char::Euhc::chop a literal, only a variable. If you Char::Euhc::chop a list of
  variables, each string in the list is chopped:

  @lines = `cat myfile`;
  Char::Euhc::chop(@lines);

  You can Char::Euhc::chop anything that is an lvalue, including an assignment:

  Char::Euhc::chop($cwd = `pwd`);
  Char::Euhc::chop($answer = <STDIN>);

  This is different from:

  $answer = Char::Euhc::chop($tmp = <STDIN>); # WRONG

  which puts a newline into $answer because Char::Euhc::chop returns the character
  chopped, not the remaining string (which is in $tmp). One way to get the result
  intended here is with substr:

  $answer = substr <STDIN>, 0, -1;

  But this is more commonly written as:

  Char::Euhc::chop($answer = <STDIN>);

  In the most general case, Char::Euhc::chop can be expressed using substr:

  $last_code = Char::Euhc::chop($var);
  $last_code = substr($var, -1, 1, ""); # same thing

  Once you understand this equivalence, you can use it to do bigger chops. To
  Char::Euhc::chop more than one character, use substr as an lvalue, assigning a null
  string. The following removes the last five characters of $caravan:

  substr($caravan, -5) = '';

  The negative subscript causes substr to count from the end of the string instead
  of the beginning. To save the removed characters, you could use the four-argument
  form of substr, creating something of a quintuple Char::Euhc::chop;

  $tail = substr($caravan, -5, 5, '');

  This is all dangerous business dealing with characters instead of graphemes. Perl
  doesn't really have a grapheme mode, so you have to deal with them yourself.

=item Index string

  $byte_pos = Char::Euhc::index($string,$substr,$byte_offset);
  $byte_pos = Char::Euhc::index($string,$substr);

  This function searches for one string within another. It returns the byte position
  of the first occurrence of $substring in $string. The $byte_offset, if specified,
  says how many bytes from the start to skip before beginning to look. Positions are
  based at 0. If the substring is not found, the function returns one less than the
  base, ordinarily -1. To work your way through a string, you might say:

  $byte_pos = -1;
  while (($byte_pos = Char::Euhc::index($string, $lookfor, $byte_pos)) > -1) {
      print "Found at $byte_pos\n";
      $byte_pos++;
  }

=item Reverse index string

  $byte_pos = Char::Euhc::rindex($string,$substr,$byte_offset);
  $byte_pos = Char::Euhc::rindex($string,$substr);

  This function works just like Char::Euhc::index except that it returns the byte
  position of the last occurrence of $substring in $string (a reverse Char::Euhc::index).
  The function returns -1 if $substring is not found. $byte_offset, if specified,
  is the rightmost byte position that may be returned. To work your way through a
  string backward, say:

  $byte_pos = length($string);
  while (($byte_pos = Char::UHC::rindex($string, $lookfor, $byte_pos)) >= 0) {
      print "Found at $byte_pos\n";
      $byte_pos--;
  }

=item Lower case string

  $lc = Char::Euhc::lc($string);
  $lc = Char::Euhc::lc_;

  This function returns a lowercased version of UHC $string (or $_, if
  $string is omitted). This is the internal function implementing the \L escape
  in double-quoted strings.

  You can use the Char::Euhc::fc function for case-insensitive comparisons via Char::UHC
  software.

=item Lower case first character of string

  $lcfirst = Char::Euhc::lcfirst($string);
  $lcfirst = Char::Euhc::lcfirst_;

  This function returns a version of UHC $string with the first character
  lowercased (or $_, if $string is omitted). This is the internal function
  implementing the \l escape in double-quoted strings.

=item Upper case string

  $uc = Char::Euhc::uc($string);
  $uc = Char::Euhc::uc_;

  This function returns an uppercased version of UHC $string (or $_, if
  $string is omitted). This is the internal function implementing the \U escape
  in interpolated strings. For titlecase, use Char::Euhc::ucfirst instead.

  You can use the Char::Euhc::fc function for case-insensitive comparisons via Char::UHC
  software.

=item Upper case first character of string

  $ucfirst = Char::Euhc::ucfirst($string);
  $ucfirst = Char::Euhc::ucfirst_;

  This function returns a version of UHC $string with the first character
  titlecased and other characters left alone (or $_, if $string is omitted).
  Titlecase is "Camel" for an initial capital that has (or expects to have)
  lowercase characters following it, not uppercase ones. Exsamples are the first
  letter of a sentence, of a person's name, of a newspaper headline, or of most
  words in a title. Characters with no titlecase mapping return the uppercase
  mapping instead. This is the internal function implementing the \u escape in
  double-quoted strings.

  To capitalize a string by mapping its first character to titlecase and the rest
  to lowercase, use:

  $titlecase = Char::Euhc::ucfirst(substr($word,0,1)) . Char::Euhc::lc(substr($word,1));

  or

  $string =~ s/(\w)(\w*)/\u$1\L$2/g;

  Do not use:

  $do_not_use = Char::Euhc::ucfirst(Char::Euhc::lc($word));

  or "\u\L$word", because that can produce a different and incorrect answer with
  certain characters. The titlecase of something that's been lowercased doesn't
  always produce the same thing titlecasing the original produces.

  Because titlecasing only makes sense at the start of a string that's followed
  by lowercase characters, we can't think of any reason you might want to titlecase
  every character in a string.

  See also P.287 A Case of Mistaken Identity
  in Chapter 6: Unicode
  of ISBN 978-0-596-00492-7 Programming Perl 4th Edition.

=item Fold case string

  P.860 fc
  in Chapter 27: Functions
  of ISBN 978-0-596-00492-7 Programming Perl 4th Edition.

  $fc = Char::Euhc::fc($string);
  $fc = Char::Euhc::fc_;

  New to Char::UHC software, this function returns the full Unicode-like casefold of
  UHC $string (or $_, if omitted). This is the internal function implementing
  the \F escape in double-quoted strings.

  Just as title-case is based on uppercase but different, foldcase is based on
  lowercase but different. In ASCII there is a one-to-one mapping between only
  two cases, but in other encoding there is a one-to-many mapping and between three
  cases. Because that's too many combinations to check manually each time, a fourth
  casemap called foldcase was invented as a common intermediary for the other three.
  It is not a case itself, but it is a casemap.

  To compare whether two strings are the same without regard to case, do this:

  Char::Euhc::fc($a) eq Char::Euhc::fc($b)

  The reliable way to compare string case-insensitively was with the /i pattern
  modifier, because Char::UHC software has always used casefolding semantics for
  case-insensitive pattern matches. Knowing this, you can emulate equality
  comparisons like this:

  sub fc_eq ($$) {
      my($a,$b) = @_;
      return $a =~ /\A\Q$b\E\z/i;
  }

=item Make ignore case string

  @ignorecase = Char::Euhc::ignorecase(@string);

  This function is internal use to m/ /i, s/ / /i, split / /i and qr/ /i.

=item Make capture number

  $capturenumber = Char::Euhc::capture($string);

  This function is internal use to m/ /, s/ / /, split / / and qr/ /.

=item Make character

  $chr = Char::Euhc::chr($code);
  $chr = Char::Euhc::chr_;

  This function returns a programmer-visible character, character represented by
  that $code in the character set. For example, Char::Euhc::chr(65) is "A" in either
  ASCII or UHC, not Unicode. For the reverse of Char::Euhc::chr, use Char::UHC::ord.

=item File test function Char::Euhc::X

  The following all functions function when the pathname ends with chr(0x5C) on
  MSWin32.

  A file test function is a unary function that takes one argument, either a
  filename or a filehandle, and tests the associated file to see whether something
  is true about it. If the argument is omitted, it tests $_. Unless otherwise
  documented, it returns 1 for true and "" for false, or the undefined value if
  the file doesn't exist or is otherwise inaccessible. Currently implemented file
  test functions are listed in:

  Available in MSWin32, MacOS, and UNIX-like systems
  ------------------------------------------------------------------------------
  Function and Prototype     Meaning
  ------------------------------------------------------------------------------
  Char::Euhc::r(*), Char::Euhc::r_()   File or directory is readable by this (effective) user or group
  Char::Euhc::w(*), Char::Euhc::w_()   File or directory is writable by this (effective) user or group
  Char::Euhc::e(*), Char::Euhc::e_()   File or directory name exists
  Char::Euhc::x(*), Char::Euhc::x_()   File or directory is executable by this (effective) user or group
  Char::Euhc::z(*), Char::Euhc::z_()   File exists and has zero size (always false for directories)
  Char::Euhc::f(*), Char::Euhc::f_()   Entry is a plain file
  Char::Euhc::d(*), Char::Euhc::d_()   Entry is a directory
  ------------------------------------------------------------------------------
  
  Available in MacOS and UNIX-like systems
  ------------------------------------------------------------------------------
  Function and Prototype     Meaning
  ------------------------------------------------------------------------------
  Char::Euhc::R(*), Char::Euhc::R_()   File or directory is readable by this real user or group
                             Same as Char::Euhc::r(*), Char::Euhc::r_() on MacOS
  Char::Euhc::W(*), Char::Euhc::W_()   File or directory is writable by this real user or group
                             Same as Char::Euhc::w(*), Char::Euhc::w_() on MacOS
  Char::Euhc::X(*), Char::Euhc::X_()   File or directory is executable by this real user or group
                             Same as Char::Euhc::x(*), Char::Euhc::x_() on MacOS
  Char::Euhc::l(*), Char::Euhc::l_()   Entry is a symbolic link
  Char::Euhc::S(*), Char::Euhc::S_()   Entry is a socket
  ------------------------------------------------------------------------------
  
  Not available in MSWin32 and MacOS
  ------------------------------------------------------------------------------
  Function and Prototype     Meaning
  ------------------------------------------------------------------------------
  Char::Euhc::o(*), Char::Euhc::o_()   File or directory is owned by this (effective) user
  Char::Euhc::O(*), Char::Euhc::O_()   File or directory is owned by this real user
  Char::Euhc::p(*), Char::Euhc::p_()   Entry is a named pipe (a "fifo")
  Char::Euhc::b(*), Char::Euhc::b_()   Entry is a block-special file (like a mountable disk)
  Char::Euhc::c(*), Char::Euhc::c_()   Entry is a character-special file (like an I/O device)
  Char::Euhc::u(*), Char::Euhc::u_()   File or directory is setuid
  Char::Euhc::g(*), Char::Euhc::g_()   File or directory is setgid
  Char::Euhc::k(*), Char::Euhc::k_()   File or directory has the sticky bit set
  ------------------------------------------------------------------------------

  The tests -T and -B takes a try at telling whether a file is text or binary.
  But people who know a lot about filesystems know that there's no bit (at least
  in UNIX-like operating systems) to indicate that a file is a binary or text file
  --- so how can Perl tell?
  The answer is that Perl cheats. As you might guess, it sometimes guesses wrong.

  This incomplete thinking of file test operator -T and -B gave birth to UTF8 flag
  of a later period.

  The Char::Euhc::T, Char::Euhc::T_, Char::Euhc::B and Char::Euhc::B_ work as follows. The first block
  or so of the file is examined for strange chatracters such as
  [\000-\007\013\016-\032\034-\037\377] (that don't look like UHC). If more
  than 10% of the bytes appear to be strange, it's a *maybe* binary file;
  otherwise, it's a *maybe* text file. Also, any file containing ASCII NUL(\0) or
  \377 in the first block is considered a binary file. If Char::Euhc::T or Char::Euhc::B is
  used on a filehandle, the current input (standard I/O or "stdio") buffer is
  examined rather than the first block of the file. Both Char::Euhc::T and Char::Euhc::B
  return 1 as true on an empty file, or on a file at EOF (end-of-file) when testing
  a filehandle. Both Char::Euhc::T and Char::Euhc::B doesn't work when given the special
  filehandle consisting of a solitary underline. Because Char::Euhc::T has to read to
  do the test, you don't want to use Char::Euhc::T on special files that might hang or
  give you other kinds or grief. So on most occasions you'll want to test with a
  Char::Euhc::f first, as in:

  next unless Char::Euhc::f($file) && Char::Euhc::T($file);

  Available in MSWin32, MacOS, and UNIX-like systems
  ------------------------------------------------------------------------------
  Function and Prototype     Meaning
  ------------------------------------------------------------------------------
  Char::Euhc::T(*), Char::Euhc::T_()   File looks like a "text" file
  Char::Euhc::B(*), Char::Euhc::B_()   File looks like a "binary" file
  ------------------------------------------------------------------------------

  File ages for Char::Euhc::M, Char::Euhc::M_, Char::Euhc::A, Char::Euhc::A_, Char::Euhc::C, and Char::Euhc::C_
  are returned in days (including fractional days) since the script started running.
  This start time is stored in the special variable $^T ($BASETIME). Thus, if the
  file changed after the script, you would get a negative time. Note that most time
  values (86,399 out of 86,400, on average) are fractional, so testing for equality
  with an integer without using the int function is usually futile. Examples:

  next unless Char::Euhc::M($file) > 0.5;     # files are older than 12 hours
  &newfile if Char::Euhc::M($file) < 0;       # file is newer than process
  &mailwarning if int(Char::Euhc::A_) == 90;  # file ($_) was accessed 90 days ago today

  Available in MSWin32, MacOS, and UNIX-like systems
  ------------------------------------------------------------------------------
  Function and Prototype     Meaning
  ------------------------------------------------------------------------------
  Char::Euhc::M(*), Char::Euhc::M_()   Modification age (measured in days)
  Char::Euhc::A(*), Char::Euhc::A_()   Access age (measured in days)
                             Same as Char::Euhc::M(*), Char::Euhc::M_() on MacOS
  Char::Euhc::C(*), Char::Euhc::C_()   Inode-modification age (measured in days)
  ------------------------------------------------------------------------------

  The Char::Euhc::s, and Char::Euhc::s_ returns file size in bytes if succesful, or undef
  unless successful.

  Available in MSWin32, MacOS, and UNIX-like systems
  ------------------------------------------------------------------------------
  Function and Prototype     Meaning
  ------------------------------------------------------------------------------
  Char::Euhc::s(*), Char::Euhc::s_()   File or directory exists and has nonzero size
                             (the value is the size in bytes)
  ------------------------------------------------------------------------------

=item Filename expansion (globbing)

  @glob = Char::Euhc::glob($string);
  @glob = Char::Euhc::glob_;

  This function returns the value of $string with filename expansions the way a
  DOS-like shell would expand them, returning the next successive name on each
  call. If $string is omitted, $_ is globbed instead. This is the internal
  function implementing the <*> and glob operator.
  This function function when the pathname ends with chr(0x5C) on MSWin32.

  For ease of use, the algorithm matches the DOS-like shell's style of expansion,
  not the UNIX-like shell's. An asterisk ("*") matches any sequence of any
  character (including none). A question mark ("?") matches any one character or
  none. A tilde ("~") expands to a home directory, as in "~/.*rc" for all the
  current user's "rc" files, or "~jane/Mail/*" for all of Jane's mail files.

  Note that all path components are case-insensitive, and that backslashes and
  forward slashes are both accepted, and preserved. You may have to double the
  backslashes if you are putting them in literally, due to double-quotish parsing
  of the pattern by perl.

  The Char::Euhc::glob function grandfathers the use of whitespace to separate multiple
  patterns such as <*.c *.h>. If you want to glob filenames that might contain
  whitespace, you'll have to use extra quotes around the spacy filename to protect
  it. For example, to glob filenames that have an "e" followed by a space followed
  by an "f", use either of:

  @spacies = <"*e f*">;
  @spacies = Char::Euhc::glob('"*e f*"');
  @spacies = Char::Euhc::glob(q("*e f*"));

  If you had to get a variable through, you could do this:

  @spacies = Char::Euhc::glob("'*${var}e f*'");
  @spacies = Char::Euhc::glob(qq("*${var}e f*"));

  Another way on MSWin32

  # relative path
  @relpath_file = split(/\n/,`dir /b wildcard\\here*.txt 2>NUL`);

  # absolute path
  @abspath_file = split(/\n/,`dir /s /b wildcard\\here*.txt 2>NUL`);

  # on COMMAND.COM
  @relpath_file = split(/\n/,`dir /b wildcard\\here*.txt`);
  @abspath_file = split(/\n/,`dir /s /b wildcard\\here*.txt`);

=item Statistics about link

  @lstat = Char::Euhc::lstat($file);
  @lstat = Char::Euhc::lstat_;

  Like Char::Euhc::stat, returns information on file, except that if file is a symbolic
  link, Char::Euhc::lstat returns information about the link; Char::Euhc::stat returns
  information about the file pointed to by the link. If symbolic links are
  unimplemented on your system, a normal Char::Euhc::stat is done instead. If file is
  omitted, returns information on file given in $_. Returns values (especially
  device and inode) may be bogus.
  This function function when the filename ends with chr(0x5C) on MSWin32.

=item Open directory handle

  $rc = Char::Euhc::opendir(DIR,$dir);

  This function opens a directory named $dir for processing by readdir, telldir,
  seekdir, rewinddir, and closedir. The function returns true if successful.
  Directory handles have their own namespace from filehandles.
  This function function when the directory name ends with chr(0x5C) on MSWin32.

=item Statistics about file

  $stat = Char::Euhc::stat(FILEHANDLE);
  $stat = Char::Euhc::stat(DIRHANDLE);
  $stat = Char::Euhc::stat($expr);
  $stat = Char::Euhc::stat_;
  @stat = Char::Euhc::stat(FILEHANDLE);
  @stat = Char::Euhc::stat(DIRHANDLE);
  @stat = Char::Euhc::stat($expr);
  @stat = Char::Euhc::stat_;

  In scalar context, this function returns a Boolean value that indicates whether
  the call succeeded. In list context, it returns a 13-element list giving the
  statistics for a file, either the file opened via FILEHANDLE or DIRHANDLE, or
  named by $expr. It's typically used as followes:

  ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
      $atime,$mtime,$ctime,$blksize,$blocks) = Char::Euhc::stat($expr);

  Not all fields are supported on all filesystem types; unsupported fields return
  0. Here are the meanings of the fields:

  -------------------------------------------------------------------------
  Index  Field      Meaning
  -------------------------------------------------------------------------
    0    $dev       Device number of filesystem
                    drive number for MSWin32
                    vRefnum for MacOS
    1    $ino       Inode number
                    zero for MSWin32
                    fileID/dirID for MacOS
    2    $mode      File mode (type and permissions)
    3    $nlink     Nunmer of (hard) links to the file
                    usually one for MSWin32 --- NTFS filesystems may
                    have a value greater than one
                    1 for MacOS
    4    $uid       Numeric user ID of file's owner
                    zero for MSWin32
                    zero for MacOS
    5    $gid       Numeric group ID of file's owner
                    zero for MSWin32
                    zero for MacOS
    6    $rdev      The device identifier (special files only)
                    drive number for MSWin32
                    NULL for MacOS
    7    $size      Total size of file, in bytes
    8    $atime     Last access time since the epoch
                    same as $mtime for MacOS
    9    $mtime     Last modification time since the epoch
                    since 1904-01-01 00:00:00 for MacOS
   10    $ctime     Inode change time (not creation time!) since the epoch
                    creation time instead of inode change time for MSWin32
                    since 1904-01-01 00:00:00 for MacOS
   11    $blksize   Preferred blocksize for file system I/O
                    zero for MSWin32
   12    $blocks    Actual number of blocks allocated
                    zero for MSWin32
                    int(($size + $blksize-1) / $blksize) for MacOS
  -------------------------------------------------------------------------

  $dev and $ino, token together, uniquely identify a file on the same system.
  The $blksize and $blocks are likely defined only on BSD-derived filesystems.
  The $blocks field (if defined) is reported in 512-byte blocks. The value of
  $blocks * 512 can differ greatly from $size for files containing unallocated
  blocks, or "hole", which aren't counted in $blocks.

  If Char::Euhc::stat is passed the special filehandle consisting of an underline, no
  actual stat(2) is done, but the current contents of the stat structure from
  the last Char::Euhc::stat, Char::Euhc::lstat, or Char::Euhc::stat-based file test function
  (such as Char::Euhc::r, Char::Euhc::w, and Char::Euhc::x) are returned.

  Because the mode contains both the file type and its permissions, you should
  mask off the file type portion and printf or sprintf using a "%o" if you want
  to see the real permissions:

  $mode = (Char::Euhc::stat($expr))[2];
  printf "Permissions are %04o\n", $mode &07777;

  If $expr is omitted, returns information on file given in $_.
  This function function when the filename ends with chr(0x5C) on MSWin32.

=item Deletes a list of files.

  $unlink = Char::Euhc::unlink(@list);
  $unlink = Char::Euhc::unlink($file);
  $unlink = Char::Euhc::unlink;

  Delete a list of files. (Under Unix, it will remove a link to a file, but the
  file may still exist if another link references it.) If list is omitted, it
  unlinks the file given in $_. The function returns the number of files
  successfully deleted.
  This function function when the filename ends with chr(0x5C) on MSWin32.

=item Changes the working directory.

  $chdir = Char::Euhc::chdir($dirname);
  $chdir = Char::Euhc::chdir;

  This function changes the current process's working directory to $dirname, if
  possible. If $dirname is omitted, $ENV{'HOME'} is used if set, and $ENV{'LOGDIR'}
  otherwise; these are usually the process's home directory. The function returns
  true on success, false otherwise (and puts the error code into $!).

  chdir("$prefix/lib") || die "Can't cd to $prefix/lib: $!";

  This function has limitation on the MSWin32. See also BUGS AND LIMITATIONS.

=item Do file

  $return = Char::Euhc::do($file);

  The do FILE form uses the value of FILE as a filename and executes the contents
  of the file as a Perl script. Its primary use is (or rather was) to include
  subroutines from a Perl subroutine library, so that:

  Char::Euhc::do('stat.pl');

  is rather like: 

  scalar eval `cat stat.pl`;   # `type stat.pl` on Windows

  except that Char::Euhc::do is more efficient, more concise, keeps track of the current
  filename for error messages, searches all the directories listed in the @INC
  array, and updates %INC if the file is found.
  It also differs in that code evaluated with Char::Euhc::do FILE can not see lexicals in
  the enclosing scope, whereas code in eval FILE does. It's the same, however, in
  that it reparses the file every time you call it -- so you might not want to do
  this inside a loop unless the filename itself changes at each loop iteration.

  If Char::Euhc::do can't read the file, it returns undef and sets $! to the error. If 
  Char::Euhc::do can read the file but can't compile it, it returns undef and sets an
  error message in $@. If the file is successfully compiled, do returns the value of
  the last expression evaluated.

  Inclusion of library modules (which have a mandatory .pm suffix) is better done
  with the use and require operators, which also Char::Euhc::do error checking and raise
  an exception if there's a problem. They also offer other benefits: they avoid
  duplicate loading, help with object-oriented programming, and provide hints to the
  compiler on function prototypes.

  But Char::Euhc::do FILE is still useful for such things as reading program configuration
  files. Manual error checking can be done this way:

  # read in config files: system first, then user
  for $file ("/usr/share/proggie/defaults.rc", "$ENV{HOME}/.someprogrc") {
      unless ($return = Char::Euhc::do($file)) {
          warn "couldn't parse $file: $@" if $@;
          warn "couldn't Char::Euhc::do($file): $!" unless defined $return;
          warn "couldn't run $file"            unless $return;
      }
  }

  A long-running daemon could periodically examine the timestamp on its configuration
  file, and if the file has changed since it was last read in, the daemon could use
  Char::Euhc::do to reload that file. This is more tidily accomplished with Char::Euhc::do than
  with Char::Euhc::require.

=item Require file

  Char::Euhc::require($file);
  Char::Euhc::require();

  This function asserts a dependency of some kind on its argument. If an argument is
  not supplied, $_ is used.

  Char::Euhc::require loads and executes the Perl code found in the separate file whose
  name is given by the $file. This is similar to using a Char::Euhc::do on a file, except
  that Char::Euhc::require checks to see whether the library file has been loaded already
  and raises an exception if any difficulties are encountered. (It can thus be used
  to express file dependencies without worrying about duplicate compilation.) Like
  its cousins Char::Euhc::do, Char::Euhc::require knows how to search the include path stored
  in the @INC array and to update %INC on success.

  The file must return true as the last value to indicate successful execution of any
  initialization code, so it's customary to end such a file with 1 unless you're sure
  it'll return true otherwise.

=item Current position of the readdir

  $telldir = Char::Euhc::telldir(DIRHANDLE);

  This function returns the current position of the readdir routines on DIRHANDLE.
  This value may be given to seekdir to access a particular location in a directory.
  The function has the same caveats about possible directory compaction as the
  corresponding system library routine. This function might not be implemented
  everywhere that readdir is. Even if it is, no calculation may be done with the
  return value. It's just an opaque value, meaningful only to seekdir.

=cut

