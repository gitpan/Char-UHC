# This file is encoded in Char::UHC.
die "This file is not encoded in Char::UHC.\n" if q{あ} ne "\x82\xa0";

use Char::UHC;
print "1..1\n";

# エラーにはならないけど文字化けする（５）
if (lc('アイウエオ') eq 'アイウエオ') {
    print "ok - 1 lc('アイウエオ') eq 'アイウエオ'\n";
}
else {
    print "not ok - 1 lc('アイウエオ') eq 'アイウエオ'\n";
}

__END__

Char::UHC.pm の処理結果が以下になることを期待している

if (Char::Euhc::lc('アイウエオ') eq 'アイウエオ') {

Shift-JISテキストを正しく扱う
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
