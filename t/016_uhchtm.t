# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{��} ne "\x82\xa0";

use Char::UHC;
print "1..1\n";

# �}�b�`���Ȃ��͂��Ȃ̂Ƀ}�b�`����i�Q�j
if ("�Z��" =~ /Z/) {
    print qq<not ok - 1 "KYODAI" =~ /Z/\n>;
}
else {
    print qq<ok - 1 "KYODAI" =~ /Z/\n>;
}

__END__

Shift-JIS�e�L�X�g�𐳂�������
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
