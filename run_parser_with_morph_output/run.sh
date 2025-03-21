## To run -- ./run.sh $1
## $1.out contains the morph output for each word.
## Structure of $1.out is as below
## wrd_no \t word \t word \t morph analysis \t morph analysis \t morph analysis
mkdir -p TEMP
mkdir -p TEMP/tmp_$1
cp $1.out TEMP/tmp_$1
/Library/WebServer/CGI-Executables/scl/MT/prog/shell/anu_skt_hnd.sh /Library/WebServer/CGI-Executables/scl TEMP/$1 TEMP hi DEV AVAILABLE NOT_AVAILABLE Prose 1
