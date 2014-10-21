# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use Char::UHC;
print "1..8\n";

my $__FILE__ = __FILE__;

my $anchor1 = q{\G(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[\x00-\xFF])*?};
my $anchor2 = q{\G(?(?!.{32766})(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[\x00-\xFF])*?|(?(?=[\x00-\x7F]+\z).*?|.*?[^\x81-\x9F\xE0-\xFC](?:[\x81-\x9F\xE0-\xFC][\x00-\xFF])*?))};

if (($] >= 5.010) or
    (($] >= 5.008) and ($^O eq 'MSWin32') and (`$^X -v` =~ /ActiveState/)) or
    (($] =~ /\A 5\.006/oxms) and ($^O eq 'MSWin32'))
) {
    if (((('A' x 32768).'B') !~ /${anchor1}B/b) and
        ((('A' x 32768).'B') =~ /${anchor2}B/b)
    ) {
        # do test
    }
    else {
        for my $tno (1..8) {
            print "ok - $tno # SKIP $^X $0\n";
        }
        exit;
    }
}
else {
    for my $tno (1..8) {
        print "ok - $tno # SKIP $^X $0\n";
    }
    exit;
}

# 32,766 �𒴂���l��ݒ肷��
my $over15bit = 33000;

my $str = '';

# �Ώۂ̓}���`�o�C�g������: ��񂾂��}�b�`����
$str = ('��1' x $over15bit) . '�A�CABC';
if ($str =~ /([A-Z]+)/o) {
    if ($1 eq 'ABC') {
        print "ok - 1 $^X $__FILE__\n";
    }
    else {
        print "not ok - 1 $^X $__FILE__\n";
    }
}
else {
    print "not ok - 1 $^X $__FILE__\n";
}

# �Ώۂ̓}���`�o�C�g������: ��񂾂��}�b�`���Ȃ�
$str = ('��1' x $over15bit) . '�Aabc';
if ($str =~ /([A-Z]+)/o) {
    print "not ok - 2 $^X $__FILE__ ($1)\n";
}
else {
    print "ok - 2 $^X $__FILE__\n";
}

# �Ώۂ̓}���`�o�C�g������: �O���[�o���}�b�`����
$str = '��1' x $over15bit . '�A�CABC'. '��2' x $over15bit . '�E�GXYZ';
if (my @array = $str =~ /([A-Z]+)/go) {
    if (join(' ',@array) eq 'ABC XYZ') {
        print "ok - 3 $^X $__FILE__\n";
    }
    else {
        print "not ok - 3 $^X $__FILE__\n";
    }
}
else {
    print "not ok - 3 $^X $__FILE__\n";
}

# �Ώۂ̓}���`�o�C�g������: �O���[�o���}�b�`���Ȃ�
$str = '��1' x $over15bit . '�A�Cabc'. '��2' x $over15bit . '�E�Gxyz';
if (my @array = $str =~ /([A-Z]+)/go) {
    print "not ok - 4 $^X $__FILE__ (@array)\n";
}
else {
    print "ok - 4 $^X $__FILE__\n";
}

# �Ώۂ̓V���O���o�C�g������: ��񂾂��}�b�`����
$str = ('a1' x $over15bit) . 'ABC';
if ($str =~ /([A-Z]+)/o) {
    if ($1 eq 'ABC') {
        print "ok - 5 $^X $__FILE__\n";
    }
    else {
        print "not ok - 5 $^X $__FILE__\n";
    }
}
else {
    print "not ok - 5 $^X $__FILE__\n";
}

# �Ώۂ̓V���O���o�C�g������: ��񂾂��}�b�`���Ȃ�
$str = ('a1' x $over15bit) . 'abc';
if ($str =~ /([A-Z]+)/o) {
    print "not ok - 6 $^X $__FILE__\n";
}
else {
    print "ok - 6 $^X $__FILE__\n";
}

# �Ώۂ̓V���O���o�C�g������: �O���[�o���}�b�`����
$str = 'a1' x $over15bit . 'ABC'. 'b2' x $over15bit . 'XYZ';
if (my @array = $str =~ /([A-Z]+)/go) {
    if (join(' ',@array) eq 'ABC XYZ') {
        print "ok - 7 $^X $__FILE__\n";
    }
    else {
        print "not ok - 7 $^X $__FILE__\n";
    }
}
else {
    print "not ok - 7 $^X $__FILE__\n";
}

# �Ώۂ̓V���O���o�C�g������: �O���[�o���}�b�`���Ȃ�
$str = 'a1' x $over15bit . 'abc'. 'b2' x $over15bit . 'xyz';
if (my @array = $str =~ /([A-Z]+)/go) {
    print "not ok - 8 $^X $__FILE__\n";
}
else {
    print "ok - 8 $^X $__FILE__\n";
}

__END__
Shift-JIS�e�L�X�g�𐳂�������
����������ɑ΂��鐳�K�\������
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
