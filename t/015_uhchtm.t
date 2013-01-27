# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{あ} ne "\x82\xa0";

use Char::UHC;
print "1..1\n";

# マッチしないはずなのにマッチする（１）
if ("ヤカン" =~ /ポット/) {
    print qq<not ok - 1 "YAKAN" =~ /POTTO/\n>;
}
else {
    print qq<ok - 1 "YAKAN" =~ /POTTO/\n>;
}

__END__

Shift-JISテキストを正しく扱う
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
