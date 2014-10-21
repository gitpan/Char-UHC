# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use Char::UHC;
print "1..10\n";

my $__FILE__ = __FILE__;

$line   = "A^�`�c�e�g";
$before = "A^";
$after  = "BB";

# �}�b�`���Ȃ��̂�������
if ($line !~ s/$before/$after/) {
    if ($line eq "A^�`�c�e�g") {
        print qq{ok - 1 \$line !~ s/\$before/\$after/ --> ($line) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 1 \$line !~ s/\$before/\$after/ --> ($line) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 1 \$line !~ s/\$before/\$after/ --> ($line) $^X $__FILE__\n};
}

$line   = "A^�`�c�e�g";
$before = "A^";
$after  = "BB";

# �}�b�`�����邽�߂ɂ� \Q...\E ���K�v
if ($line =~ s/\Q$before\E/$after/) {
    if ($line eq "BB�`�c�e�g") {
        print qq{ok - 2 \$line =~ s/\\Q\$before\\E/\$after/ --> ($line) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 2 \$line =~ s/\\Q\$before\\E/\$after/ --> ($line) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 2 \$line =~ s/\\Q\$before\\E/\$after/ --> ($line) $^X $__FILE__\n};
}

$line   = "�^�`�c�e�g";
$before = "�^";
$after  = "��";

# ���̋L�q�� JPerl �̏ꍇ�̓}�b�`���APerl �̏ꍇ�̓}�b�`���Ȃ�
# Perl �݊��� JPerl �݊��̂ǂ���ɂ��邩�Y�񂾂�...
# Perl �݊��Ƃ������ƂŃ}�b�`���Ȃ��̂��������Ƃ������Ƃɂ���
if ($line !~ s/$before/$after/) {
    if ($line eq "�^�`�c�e�g") {
        print qq{ok - 3 \$line !~ s/\$before/\$after/ --> ($line) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 3 \$line !~ s/\$before/\$after/ --> ($line) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 3 \$line !~ s/\$before/\$after/ --> ($line) $^X $__FILE__\n};
}

$line   = "�^�`�c�e�g";
$before = "�^";
$after  = "��";

# �}�b�`�����邽�߂ɂ� Perl �̏ꍇ�̂悤�� \Q...\E ���K�v
if ($line =~ s/\Q$before\E/$after/) {
    if ($line eq "���`�c�e�g") {
        print qq{ok - 4 \$line =~ s/\\Q\$before\\E/\$after/ --> ($line) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 4 \$line =~ s/\\Q\$before\\E/\$after/ --> ($line) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 4 \$line =~ s/\\Q\$before\\E/\$after/ --> ($line) $^X $__FILE__\n};
}

$line = "����������";
$ret = $line =~ s/�^/��/g;

if (not $ret) {
    if ($line eq "����������") {
        print qq{ok - 5 "����������" =~ s/�^/��/ --> ($ret)($line) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 5 "����������" =~ s/�^/��/ --> ($ret)($line) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 5 "����������" =~ s/�^/��/ --> ($ret)($line) $^X $__FILE__\n};
}

$line = "�^��������";
$ret = $line =~ s/�^/��/g;

if ($ret == 1) {
    if ($line eq "����������") {
        print qq{ok - 6 "�^��������" =~ s/�^/��/ --> ($ret)($line) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 6 "�^��������" =~ s/�^/��/ --> ($ret)($line) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 6 "�^��������" =~ s/�^/��/ --> ($ret)($line) $^X $__FILE__\n};
}

$line = "�^���^���^";
$ret = $line =~ s/�^/��/g;

if ($ret == 3) {
    if ($line eq "����������") {
        print qq{ok - 7 "�^���^���^" =~ s/�^/��/ --> ($ret)($line) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 7 "�^���^���^" =~ s/�^/��/ --> ($ret)($line) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 7 "�^���^���^" =~ s/�^/��/ --> ($ret)($line) $^X $__FILE__\n};
}

$line = "����������";
$ret = $line !~ s/�^/��/g;

if ($ret == 1) {
    if ($line eq "����������") {
        print qq{ok - 8 "����������" !~ s/�^/��/ --> ($ret)($line) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 8 "����������" !~ s/�^/��/ --> ($ret)($line) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 8 "����������" !~ s/�^/��/ --> ($ret)($line) $^X $__FILE__\n};
}

$line = "�^��������";
$ret = $line !~ s/�^/��/g;

if (not $ret) {
    if ($line eq "����������") {
        print qq{ok - 9 "�^��������" !~ s/�^/��/ --> ($ret)($line) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 9 "�^��������" !~ s/�^/��/ --> ($ret)($line) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 9 "�^��������" !~ s/�^/��/ --> ($ret)($line) $^X $__FILE__\n};
}

$line = "�^���^���^";
$ret = $line !~ s/�^/��/g;

if (not $ret) {
    if ($line eq "����������") {
        print qq{ok - 10 "�^���^���^" !~ s/�^/��/ --> ($ret)($line) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 10 "�^���^���^" !~ s/�^/��/ --> ($ret)($line) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 10 "�^���^���^" !~ s/�^/��/ --> ($ret)($line) $^X $__FILE__\n};
}

__END__

�l�͌����͂Ă� > �E�F�u���� > perl�Łu�^�v�̒u�����ł��Ȃ��̂ŁA�Ώ����@�����Ă��������B
http://q.hatena.ne.jp/1222486577

samasuya ����̎���

perl�Łu�^�v�̒u�����ł��Ȃ��̂ŁA�Ώ����@�����Ă��������B
 
WindowsXP�ɃC���X�g�[������perl, v5.8.7�ŁA�u�^�v�̒u�����s�������̂ł����A
�Ȃ����ł��܂���B���̑��̕����͂ł��܂��B

�\�[�X�ł����A

$line   = "�^�`�c�e�g";
$before = "�^";
$after  = "��";
$line =~ s/$before/$after/;
print $line;

�ł��B

�\�[�X�́ASJIS�ŏ����Ă܂��B
��낵�����肢���܂�
