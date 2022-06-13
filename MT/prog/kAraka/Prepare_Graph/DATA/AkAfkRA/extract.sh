#Following scripyt generates all the .ml files
perl ./extract.pl < Master_verb_data

#OLD SCRIPT
### Script for extracting verb lists from the Master_verb_data
#grep xvi1 Master_verb_data | cut -f1 | grep -v '#' > xvikarmaka_XAwu_list1
#grep xvi2 Master_verb_data | cut -f1 | grep -v '#' > xvikarmaka_XAwu_list2
#grep sakarmaka Master_verb_data | cut -f1 | grep -v '#' > sakarmaka_XAwu_list
#grep '	akarmaka' Master_verb_data | cut -f1 | grep -v '#' > akarmaka_XAwu_list
#
#grep gawi Master_verb_data | cut -f1 | grep -v '#' > gawyarWa_XAwu_list 
## grep sakarmaka removed, since we extract all the gawi verbs
#grep buxXi Master_verb_data | grep sakarmaka | cut -f1 | grep -v '#' > buxXyarWa_XAwu_list
#grep Sabxakarma Master_verb_data | grep sakarmaka | cut -f1 | grep -v '#' > Sabxakarma_XAwu_list
#grep prawyavasAnArWa Master_verb_data | grep sakarmaka | cut -f1 | grep -v '#' > prawyavasAnArWa_XAwu_list
#
#grep vAkyakarma Master_verb_data | cut -f1 | grep -v '#' > vAkyakarma_XAwu_list
#grep Axikarma Master_verb_data | cut -f1 | grep -v '#' > Axikarma_XAwu_list
#grep karwqsamAnAXikaraNa Master_verb_data | cut -f1 | grep -v '#' > karwqsamAnAXikaraNa_XAwu_list
#grep karmasamAnAXikaraNa Master_verb_data | cut -f1 | grep -v '#' > jnk
#cat buxXyarWa_XAwu_list >> jnk
#sort -u jnk > karmasamAnAXikaraNa_XAwu_list
#rm jnk
#
#grep '	SliR' Master_verb_data | cut -f1 | grep -v '#' > SliR_Axi_list
#grep '	Sak' Master_verb_data | cut -f1 | grep -v '#' > SakAxi_list
#
### Script for extracting upapaxa files from the upapaxa_Master_Data
##grep '	2	' upapaxa_Master_Data | cut -f1 | grep -v '#' | sort -u > upapaxa_2
##grep '	3	' upapaxa_Master_Data | cut -f1 | grep -v '#' | sort -u > upapaxa_3
##grep '	4	' upapaxa_Master_Data | cut -f1 | grep -v '#' | sort -u > upapaxa_4
##grep '	5	' upapaxa_Master_Data | cut -f1 | grep -v '#' | sort -u > upapaxa_5
##grep '	6	' upapaxa_Master_Data | cut -f1 | grep -v '#' | sort -u > upapaxa_6
##grep '	7	' upapaxa_Master_Data | cut -f1 | grep -v '#' | sort -u > upapaxa_7
##grep aXikaraNa upapaxa_Master_Data | cut -f1 | grep -v '#' | sort -u > upapaxa_aXikaraNa_list
##grep sambanXa upapaxa_Master_Data | cut -f1 | grep -v '#' | sort -u > upapaxa_sambanXa_list
##grep viSeRaNa upapaxa_Master_Data | cut -f1 | grep -v '#' | sort -u > upapaxa_viSeRaNa_list
