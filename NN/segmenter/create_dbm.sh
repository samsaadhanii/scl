rm -f rS?.dbm S?.dbm
sort -nr -k3 samAsa_rules.txt > samAsa_rules_sorted.txt
./create_dbm_for_new_rules.pl S < samAsa_rules_sorted.txt
