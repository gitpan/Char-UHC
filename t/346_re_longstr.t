# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use Char::UHC;
print "1..1\n";

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
        for my $tno (1..1) {
            print "ok - $tno # SKIP $^X $0\n";
        }
        exit;
    }
}
else {
    for my $tno (1..1) {
        print "ok - $tno # SKIP $^X $0\n";
    }
    exit;
}

my $data = <<END;
<dl>
<td>aaa</td>
<dd>12345</dd>
</dl>
END
$data = $data x int(40000 / length($data));

my $bbb = <<END;
<dl>
<td>bbb</td>
<dd>6789</dd>
</dl>
END

my $ccc = <<END;
<dl>
<td>ccc</td>
<dd>6789</dd>
</dl>
END

my $data2 = "$data$bbb";
$data2 =~ s|<td>bbb</td>|<td>ccc</td>|;

if ($data2 eq "$data$ccc") {
    print "ok - 1 $^X $__FILE__\n";
}
else {
    print "not ok - 1 $^X $__FILE__\n";
}

__END__

http://okwave.jp/qa/q6674287.html
Perl �t�@�C����C�ǂ݌�̐��K�\���ɂ���
Perl�ňȉ��̒ʂ�A
html�t�@�C����S�ēǂݍ��񂾌�ɐ��K�\���𓖂Ă����̂ł����A���܂������܂���B
���k�ł����A�����������m�̕���������Ⴂ�܂����狳���Ē����܂���ł��傤���B
�܂��A���ɗǂ��������@������܂����狳���Ē�����ƍK���ł��B
��PC����windows7, perl5.12�ł��B���ɕs�����������܂����炲�w�E�������B

-----
#--test.html(�����̐����͍s��)
000001 <dl>
000002 <dt>aaa</dt>
000003 <dd>12345</dd>
000004 </dl>

�i�����j

120001 <dl>
120002 <dt>bbb</dt>
120003 <dd>6789</dd>
120004 </dl>

#--test.pl
open IN , "test.html";
local $/ = undef;
$data = <IN>;
close IN;

$data =~ s|<td>bbb</td>|<td>ccc</td>|;
print "$data\n";
-----

�t�@�C���̎n�߂̕����Ɠ�����̂ɁA�㔼�ł͓�����܂���B
���K�\���̑ΏۂƂ��đ傫�������ł��傤���E�E�E�B

$data =~ s|<td>aaa</td>|<td>ccc</td>|;
�́A������܂���

$data =~ s|<td>bbb</td>|<td>ccc</td>|;
���Ɠ�����܂���B

�ǂ�����낵�����肢�������܂��B
