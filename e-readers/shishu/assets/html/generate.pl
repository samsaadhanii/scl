#!/usr/bin/perl
#use JSON;
#use allow_nonref;

$/ = "</table>";
my $fileName = $ARGV[0];
    my @trs = ();   

open (my $file , $fileName);

while (my $line = <$file>){

    @lines = split("\n",$line);
    
    my $length = scalar @lines;
    
    my $count =1;
	
 
    for(my $i= 0; $i < $length; $i++){
        
        if($lines[$i] =~ /^<tr/){
        
            if($lines[$i] =~ / onmouseover/){
                
                my @tds = split("</td>",$lines[$i]);
		my @tdss;
                if($count == 1){
                    
		my $text ='';

                    if($tds[0] =~ /<td class=\"([A-Za-z0-9]+)\">(.*)/){
                        my $row = "row".$count."#!".$1."#!".$2;
                        
                       # if($tds[0] =~ /onmouseover=\"Tip\((.*)\)/){
                         if($tds[0] =~ /<img src=(.*)><\//){
                            $row = $row."#!".$1;
                        }
                        $row = $row."\n";
                        
			my $td = {
				row => 'row'.$count,
				class => $1,
				data => $2 
                
			};
            
			push(@tdss,$td);
			$text = $row;
			
                    }
                    
                    if($tds[1] =~ /<td class=\"([A-Za-z0-9]+)\">(.*)/){
                        my $row = "row".$count."#!".$1."#!".$2;
                        
                         if($tds[1] =~ /<img src=(.*)><\//){
                            $row = $row."#!".$1;
                        }
                        $row = $row."\n";
                        
                        
			my $td = {
				row => 'row'.$count,
				class => $1,
				data => $2 
			};	
			$text = $text."#!".$row;
                     #   print  $row;
                    }
                   $text =~ s/\n//g; 
                    print $text."\n";
                    
                }else{
                
                  
                    if($tds[0] =~ /<td class=\"([A-Za-z0-9]+)\">(.*)/){
                      
                        my $row = "row".$count."#!".$1."#!".$2;
                        
                         if($tds[0] =~ /<img src=(.*)><\//){
                            $row = $row."#!".$1;
                        }
                        $row = $row."\n";
                        
                        print $row."\n";
                    }
                }
            
            }else{
            my @tds = split("</td>",$lines[$i]);
                if($tds[0] =~ /<td class=\"([A-Za-z0-9]+)\">(.*)/){
                        
                        my $row =  "row".$count."#!".$1."#!".$2;

                       print $row;
                }
                
                
                    if($tds[1] =~ /<td class=\"([A-Za-z0-9]+)\">(.*)/){
                        
                        my $row =  "row".$count."#!".$1."#!".$2;
                        print "#!".$row;
                }
            
                 print "\n";
            }
           
           $count++;
        }
        
    }
	print "\n";
    
    
    #print $#trs;

}
