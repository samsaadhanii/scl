#perl create_dbm.pl tag_word_freq.dbm word_freq.dbm < $1
/usr/bin/perl $1/src/get_rank.pl $1/dbm/tag_word_freq.dbm $1/dbm/word_freq.dbm < $2 | /usr/bin/perl $1/src/show_out.pl | /usr/bin/perl $1/src/assignTagLabel.pl
