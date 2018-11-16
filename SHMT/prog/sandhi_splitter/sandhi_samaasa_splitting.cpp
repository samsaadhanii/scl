/*
#  Copyright (C) 2008-2010 Vipul Mittal
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either
#  version 2 of the License, or (at your option) any later
#  version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
*/

#include<iostream>
#include<string.h>
#include<stdlib.h>
#include<algorithm>
#include<fstream>
#include<sstream>
#include<map>
#include<vector>

using namespace std;
typedef vector < string > newType;

void splitstring(string str, string seperater, string &first, string &second) //will split a string into 2
{
	int i = (int)str.find(seperater); //find seperator
	if(i != -1)
	{
		int y = 0;
		if(!str.empty())
		{
			while(y != i)
			{
				first += str[y++]; //creating first string
			}
			y = y+(int)seperater.length(); //jumping forward seperater length
			while(y != str.length())
			{
				second += str[y++]; //creating second string
			}

		}
	}
	else
	{
		first = str;
		second = "NULL"; //if seperator is not there then second string == null 
	}
}

int main(int argc,char *argv[])
{
	if(argc!=9)
	{
		printf("Usage : ./a.out [option1] [option2] <word probabilities file> <rule file> <fst path> <fst bin file> <input file> no_of_splits\n");
		printf("---------- OPTION 1 ---------\n");
		printf("-t for getting the optimal solution (testing)\n");
		printf("-c for comparing with the correct solution\n");
		printf("---------- OPTION 2 ---------\n");
		printf("-s for considering sandhi only\n");
		printf("-S for considering samaasa only\n");
		printf("-b for considering both sandhi and samaasa\n");
		exit(1);
	}
	int MAX_LENGTH=1000,tot_freq=0,initial=0,final=0;
	string sym,input,sandhi;
	char line[MAX_LENGTH],line2[MAX_LENGTH],*p,*q,*r,*s;
	map < char, vector <string> > rules;
	map < string, vector <string> > rules2;
	map < string, double > weights;
	map < string, int > word_prob;


	//-----------------------------------------------------------------------------------------------------
	// rule mapping
	ifstream fin(argv[4]);
	while(fin.getline(line,MAX_LENGTH))
	{
		p=strtok(line,"\t");
		r=strtok(NULL,"\t");
		s=strtok(NULL,"\n");
		tot_freq = tot_freq + atof(s);
		//	cout<<sym<<endl;
	}
	fin.close();
	ifstream fin2(argv[4]);
	while(fin2.getline(line,MAX_LENGTH))
	{
		char ch10[3],ch11[3], ch12[3];
		ch10[0]='-';
		ch10[1]='s';
		ch10[2]='\0';
		ch11[0]='-';
		ch11[1]='S';
		ch11[2]='\0';
		ch12[0]='-';
		ch12[1]='b';
		ch12[2]='\0';
		string opt2=(string)ch10;
		string opt3=(string)ch11;
		string opt4=(string)ch12;
		
		p=strtok(line,"\t");
		r=strtok(NULL,"\t");
		s=strtok(NULL,"\n");
		string sym5;
		if(strlen(r)==3)
		{
			char ch[5];
			ch[0]=r[0];
			ch[1]='-';
			ch[2]=r[1];
			ch[3]=r[2];
			ch[4]='\0';
			sym5=(string)ch;
		}
		else
		{
			char ch1[6];
			ch1[0]=r[0];
			ch1[1]=r[1];
			ch1[2]='-';
			ch1[3]=r[2];
			ch1[4]=r[3];
			ch1[5]='\0';
			sym5=(string)ch1;
		}
//cout<<r<<"\t"<<sym5<<endl;

		if(opt2.compare((string)argv[2])==0) //sandhi only -s
		{
			sym=(string)r+"="+(string)p;
			weights[sym] = atof(s) / tot_freq;
			if(strlen(p)>1)
				rules2[(string)p].push_back((string)r);
			else
				rules[p[0]].push_back((string)r);

		}
		else if(opt3.compare((string)argv[2])==0) //samaasa only -S
		{
	//		cout<<r<<"\t"<<sym5<<endl;
			weights[sym5+"="+(string)p] = atof(s) / tot_freq;
			if(strlen(p)>1)
				rules2[(string)p].push_back(sym5);
			else
				rules[p[0]].push_back(sym5);
		}
		else if(opt4.compare((string)argv[2])==0) //both samaasa and sandhi -b
		{		
			sym=(string)r+"="+(string)p;
			weights[sym] = atof(s) / tot_freq;
			weights[sym5+"="+(string)p] = atof(s) / tot_freq;
			if(strlen(p)>1)
			{
				rules2[(string)p].push_back(sym5);
				rules2[(string)p].push_back((string)r);
			}
			else
			{
				rules[p[0]].push_back(sym5);
				rules[p[0]].push_back((string)r);
			}
		}
	}
	fin2.close();
//	cout<<"rules_done"<<endl; //Anil


	//--------------------------------------------------------------------------------------------------------------
	// corpus probabilities
	int corpus_size=0;
	ifstream fin10(argv[3]);
	while(fin10.getline(line,MAX_LENGTH))
	{
		corpus_size++;
		p=strtok(line," ");
		q=strtok(NULL,"\n");
		word_prob[(string)q]=atof(p);
	}
	fin10.close();
//	cout<<"word probabilities calculated\n"; //Anil
	//cout<<"rules done"<<endl;
	/*	map < char, vector <string> > :: const_iterator iter;
		for(iter=rules.begin();iter!=rules.end();iter++)
		{
		vector<string> temp=rules[(*iter).first];
		printf("for %c\n",(*iter).first);
		for(int i=0;i<temp.size();i++)
		{
		cout<<"\t"<<(*iter).first<<"="<<temp[i]<<endl;
		}
		}*/
	//cin>>input;


	//--------------------------------------------------------------------------------------------------------------------
	// analyzing the input

	ofstream fout1("full_output",ios::out);	//coantains all the vaild splits
	ofstream fout2("expected_output",ios::out);	//contains the correct split with its rank and weight
	ofstream fout3("words_notdone",ios::out);	//contains words for which no split is found
	ofstream fout4("expected_output_notfound",ios::out);	//cotains words for which the correct split is not present in the valid splits
	ofstream fout6("rank_percentages",ios::out);	//contains the percentage distribution of each rank
	ofstream fout7("percent_discards",ios::out);	//contains the percentage of splits discarded by the morph analyser for each word
	char ch3[3],ch4[3];
	ch3[0]='-';
	ch3[1]='c';
	ch3[2]='\0';
	ch4[0]='-';
	ch4[1]='t';
	ch4[2]='\0';
	string opt=(string)ch3;
	string opt1=(string)ch4;
	ifstream fin3(argv[7]);
	int no=1,correct_ones=0;
	map < int, int > ranks;
	while(fin3.getline(line,MAX_LENGTH))
	{
		if(opt.compare((string)argv[1])==0)
		{
			p=strtok(line,"\t");
			q=strtok(NULL,"\t");
			q=strtok(NULL,"\n");
			input=(string)p;
			cout<<no++<<"\tdoing : "<<input<<endl; //Anil
			sandhi=(string)q;
		//	cout<<input<<"\t"<<sandhi<<endl; //Anil
		}
		else
		{
			//cout<<no++<<"\tdoing -t : "<<input<<endl; //Anil
			p=strtok(line,"\n");
			input=(string)p;
	//		cout <<input<<" = "; //put by Anil
		}
		char ch[4],ch1[2],ch2[3],ch3[1];
		int check=0,first=0;
		vector < string > temp_split;
		vector < string > temp_rule_applied;
		vector < int > temp_index;
		vector < int > temp_no_of_splits;
		vector < string > split;
		vector < string > rule_applied;
		vector < int > no_of_splits;
		vector < int > index;
		ch1[0]=input[0];
		ch1[1]='\0';
		ch3[0]='\0';
		split.push_back((string)ch1);
		rule_applied.push_back((string)ch3);
		index.push_back(0);
		no_of_splits.push_back(0);
		while(check==0)
		{
			check=1;
			//		cout<<"\n\ngoing again thru while";
			for(int i=0;i<split.size();i++)
			{
				//cout<<"\nfor split : "<<split[i]<<"\n";
				//if(no_of_splits[i]<=4)
				if(no_of_splits[i]<=atoi(argv[8]))
				{
					if(index[i]>=input.length())
					{
						temp_split.push_back(split[i]);
						temp_no_of_splits.push_back(no_of_splits[i]);
						temp_index.push_back(index[i]);
						temp_rule_applied.push_back(rule_applied[i]);
						//cout<<"hello5	"<<split[i]<<"\t"<<index[i]<<"\t"<<no_of_splits[i]<<endl;
					}
					else 
					{
						ch1[0]=input[index[i]];
						ch1[1]='\0';
						sym=(string)ch1;
						ch2[0]=input[index[i]];
						ch2[1]=input[index[i]+1];
						ch2[2]='\0';
						string sym1=(string)ch2;
						ch[0]=input[index[i]];
						ch[1]=input[index[i]+1];
						ch[2]=input[index[i]+2];
						ch[3]='\0';
						string sym2=(string)ch;
						if(first==0)
						{
							temp_split.push_back(sym);
							//cout<<"hello11	"<<sym<<"\t"<<index[i]+1<<"\t"<<no_of_splits[i]<<endl;
						}
						else
						{	
							temp_split.push_back(split[i]+sym);
							//cout<<"hello12	"<<split[i]+sym<<"\t"<<index[i]+1<<"\t"<<no_of_splits[i]<<endl;
						}
						temp_no_of_splits.push_back(no_of_splits[i]);
						temp_index.push_back(index[i]+1);
						temp_rule_applied.push_back(rule_applied[i]);
						if(index[i]+1<input.length())
							check=0;
						if(rules[input[index[i]]].size()>0) //a rule found a+b=x 
						{
							for(int j=0;j<rules[input[index[i]]].size();j++)
							{
								string sym3=rules[input[index[i]]][j];
								if(first==0)
								{	temp_split.push_back(sym3);
									//cout<<"hello21	"<<sym3<<"\t"<<index[i]+1<<"\t"<<no_of_splits[i]+1<<endl;
								}
								else
								{	temp_split.push_back(split[i]+sym3);
									//cout<<"hello22	"<<split[i]+sym3<<"\t"<<index[i]+1<<"\t"<<no_of_splits[i]+1<<endl;
								}
								temp_no_of_splits.push_back(no_of_splits[i]+1);
								temp_rule_applied.push_back(rule_applied[i]+sym3+"="+sym+"|");
								temp_index.push_back(index[i]+1);
								if(index[i]+1<input.length())
									check=0;
							}
						}
						if(rules2[sym1].size()>0) //rule type a+b=xy
						{
							//	cout<<"entering a+b=xy part\n";
							for(int j=0;j<rules2[sym1].size();j++)
							{
								string sym3=rules2[sym1][j];
								if(first==0)
								{	temp_split.push_back(sym3);
									//cout<<"hello31	"<<sym3<<"\t"<<index[i]+2<<"\t"<<no_of_splits[i]+1<<endl;
								}
								else
								{	temp_split.push_back(split[i]+sym3);
									//cout<<"hello32	"<<split[i]+sym3<<"\t"<<index[i]+2<<"\t"<<no_of_splits[i]+1<<endl;
								}
								temp_no_of_splits.push_back(no_of_splits[i]+1);
								temp_rule_applied.push_back(rule_applied[i]+sym3+"="+sym1+"|");
								temp_index.push_back(index[i]+2);
								if(index[i]+2<input.length())
									check=0;
							}
						}
						if(rules2[sym2].size()>0) //rule type a+b=xyz
						{
							for(int j=0;j<rules2[sym2].size();j++)
							{
								string sym3=rules2[sym2][j];
								if(first==0)
								{
									temp_split.push_back(sym3);
									//cout<<"hello41	"<<split[i]<<"\t"<<index[i]+3<<"\t"<<no_of_splits[i]+1<<endl;
								}
								else
								{
									temp_split.push_back(split[i]+sym3);
									//cout<<"hello42	"<<split[i]+sym3<<"\t"<<index[i]+3<<"\t"<<no_of_splits[i]+1<<endl;
								}
								temp_no_of_splits.push_back(no_of_splits[i]+1);
								temp_rule_applied.push_back(rule_applied[i]+sym3+"="+sym2+"|");
								temp_index.push_back(index[i]+3);
								if(index[i]+3<input.length())
									check=0;
							}
						}
					}
				}
			}
			first=1;
			split=temp_split;
			index=temp_index;
			no_of_splits=temp_no_of_splits;
			rule_applied=temp_rule_applied;
			temp_rule_applied.clear();
			temp_split.clear();
			temp_index.clear();
			temp_no_of_splits.clear();
		}
//		cout<<"done splitting\n"; //Anil
		string a,d;
		map <string, int> output;
		ofstream fout("temp_result",ios::out);
		vector < string > vechar;
		vector < string > vechar1;
		vector < newType > new_splits;
		vector < newType > new_rule_applied;
		map < string, vector < string > > :: const_iterator iter;
		for(int k=0; k<split.size(); k++)
		{
			//vector < string > temp;
			//vector < string > temp1;
			a=split[k];
		//	cout<<split[k]<<"\t"<<a.length()<<"\t"<<a[a.length()-2]<<endl;
			if(a[a.length()-2]!='+')
			{
				//cout<<a<<endl;
				d=rule_applied[k];
				for(int j=0;j<no_of_splits[k];j++)
				{
					string b,c,e,f;
					splitstring(a,"+",b,c);
					splitstring(d,"|",e,f);
					vechar.push_back(b);
					vechar1.push_back(e);
					if(output[b]==0)
					{
						fout<<b<<endl;
						output[b]=1;
					}
					a=c;
					d=f;
				}
				vechar.push_back(a);
				if(output[a]==0)
				{
					fout<<a<<endl;
					output[a]=1;
				}
				new_splits.push_back(vechar);
				new_rule_applied.push_back(vechar1);
				vechar.clear();
				vechar1.clear();
			}
		}
		initial=initial+split.size();
		output.clear();
		split.clear();
		no_of_splits.clear();
		rule_applied.clear();
		string command=(string)argv[5]+" -c "+(string)argv[6]+" < temp_result > temp_result_mo; grep '*' temp_result_mo > todelete; sed 's/[^\\/]\\+sa-u-pa[^\\/]\\+//g' temp_result_mo | grep '\\/$'>> todelete";
// Delete all unanalysed segments as well as segments which are sa-u-pa pratipadikas
		system(command.c_str());
		ifstream fin1("todelete");
		while(fin1.getline(line,MAX_LENGTH))
		{
			p=strtok(line,"/");
			string d,e;
			splitstring((string)p,"^",d,e);
			//	cout<<"e="<<e<<endl;
			output[e]=1;
		}
		fin1.close();
//	system("rm /tmp/result /tmp/temp_result");
//		cout<<"done\n"; //Anil

		vector < double > tot_cost;
		map < double, int > costs;
		vector < double > final_costs;
		map < double, vector < newType > > output1;
		tot_cost.assign(new_splits.size(),1);
		for(int i=1; i<new_splits.size(); i++)
		{
			int chk=0;
			for(int k=0;k<new_splits[i].size()-1;k++)
			{
				if(output[new_splits[i][k]]==1 || output[new_splits[i][k+1]]==1)
				{
					chk=1;
					break;
				}
				else
				{
					if(new_splits[i][k][new_splits[i][k].size()-1]=='-')
					{	
						string a,b;
						splitstring(new_splits[i][k],"-",a,b);
						if(word_prob[a]==0) {
							tot_cost[i] = tot_cost[i] *  (1 / (corpus_size*1.0) ) * weights[new_rule_applied[i][k]];
//							cout << "F\t" << a << word_prob[a] <<"\t"<< tot_cost[i]<<"\n"; // AMBA
						}
						else{
							tot_cost[i] = tot_cost[i] *  (word_prob[a] / (corpus_size*1.0) ) * weights[new_rule_applied[i][k]];
//							cout << "E\t" << a << word_prob[a] <<"\t"<< tot_cost[i]<<"\n"; // AMBA
						}
					//	cout<<"if : "<<a<<"\t"<<new_rule_applied[i][k]<<endl;
					}
					else
					{
						if(word_prob[new_splits[i][k]]==0)
						{
						//	cout<<"0 one\n";
							tot_cost[i] = tot_cost[i] *  (1 / (corpus_size*1.0) ) * weights[new_rule_applied[i][k]];
//							cout << "D\t" << new_splits[i][k] << word_prob[new_splits[i][k]] <<"\t"<< tot_cost[i]<<"\n"; // AMBA
						}
						else
							tot_cost[i] = tot_cost[i] * ( (word_prob[new_splits[i][k]]) / (corpus_size*1.0) ) * weights[new_rule_applied[i][k]];
//							cout <<  "C\t" << new_splits[i][k] << word_prob[new_splits[i][k]] <<"\t"<< tot_cost[i]<<"\n"; // AMBA
					//	tot_cost[(*map_iter).first][k]=tot_cost[(*map_iter).first][k]*weights[temp6[j]];
					//	cout<<"else : "<<new_splits[i][k]<<"\t"<<new_rule_applied[i][k]<<endl;
					}
				}
			}
			if(word_prob[new_splits[i][new_splits[i].size()-1]] ==0){
				tot_cost[i] = tot_cost[i] *  (1 / (corpus_size*1.0) );
//				cout << "B\t" << new_splits[i][new_splits[i].size()-1] <<"\t"<< tot_cost[i]<<"\n"; // AMBA
			}else{
				tot_cost[i] = tot_cost[i] * ( (word_prob[new_splits[i][new_splits[i].size()-1]]) / (corpus_size*1.0) );
//				cout << "A\t" << word_prob[new_splits[i][new_splits[i].size()-1]] << "\t"<< new_splits[i][new_splits[i].size()-1] <<"\t"<< tot_cost[i]<<"\n"; // AMBA
			}
			//cout<<new_splits[i][new_splits[i].size()-1]<<endl;
			if(chk==0)
			{
				tot_cost[i]=tot_cost[i]/(new_splits[i].size());
				if(costs[tot_cost[i]]==0)
				{
					final_costs.push_back(tot_cost[i]);
					costs[tot_cost[i]]=1;
				}
				output1[tot_cost[i]].push_back(new_splits[i]);
			}
		}
		if(output1.size()==0)
		{
			if(opt.compare((string)argv[1])==0)
				fout3<<input<<"\t=>\t"<<sandhi<<endl;
			else
// Amba				cout<<input<<"=No splittings found\n"; //Anil
				cout<<input<<" = "<<input<<"\t0\n"; //Anil
			continue;
		} 
//		cout<<"done calculating saliencies\n"; //Anil
		sort(final_costs.begin(),final_costs.end());
		int chk=0,found=0,count=0;
		fout1<<"\nThe possible splits for : "<<input<<endl;
		for(int i=final_costs.size()-1;i>=0;i--)
		{
			vector < newType > temp1;
			temp1 = output1[final_costs[i]];
			count++;
			for(int j=0;j<temp1.size();j++)
			{
				string word;
				for(int k=0; k<temp1[j].size()-1; k++)
				{
					word = word + temp1[j][k] + "+";
				}
				word = word + temp1[j][temp1[j].size()-1];
				fout1<<word<<"\t"<<final_costs[i]<<"\t"<<count<<"\n";
				if(opt1.compare((string)argv[1])==0 && count==1)
				{
				//	cout<<no++<<"\tThe optimal split for "<<input<<" : "; //Anil
				//	cout<<word<<"\t"<<final_costs[i]<<"\t"<<count<<"\t"; //Anil
				//	cout <<input <<" # "<<word<<endl; //put by Anil
			//		cout <<word<<"/"; //put by Anil
					cout <<input<<" = "; //put by Anil
					cout <<word<<"\t"<<final_costs[i]<<"\n"; //put by Anil
					found=1;
				}
				else if(opt.compare((string)argv[1])==0 && word.compare(sandhi)==0)
				{
				//	cout<<"enter\n";
					correct_ones++;
					fout2<<"\nThe expected split for : "<<input<<endl;
					fout2<<word<<"\t"<<final_costs[i]<<"\t"<<count<<"\t";
					found=1;
					ranks[count]=ranks[count]+1;
				}
			}
		}
		if(opt1.compare((string)argv[1])==0)
			cout<<endl;
		final=final+count;
		if(found==1)
		{
			if(opt.compare((string)argv[1])==0)
				fout2<<count<<endl;
			else
				//cout<<count<<endl;//Anil
			found=0;
		}
		else if(found==0 && chk==0)
		{
			fout4<<input<<"\t=>\t"<<sandhi<<endl;
		}
		if(chk==0)
		{
			double per;
			per=(new_splits.size()-count)/(double)new_splits.size()*100;
			fout7<<"for "<<input<<" : "<<new_splits.size()<<"\t"<<count<<"\t"<<per<<endl;
		}
	}
	fin3.close();
	fout1.close();
	fout7.close();
//	cout<<initial<<"\t"<<final<<endl; //Anil
	double per1;
	per1=(initial-final)/(double)initial*100;
	//cout<<"% outputs discarded by morph analyzer : "<<per1<<endl; //Anil
	if(opt.compare((string)argv[1])==0)
	{
		map < int, int > :: const_iterator iter2;
		for(iter2=ranks.begin();iter2!=ranks.end();iter2++)
		{
			double per;
			//      cout<<count[(*iter).first]<<endl;
			per=ranks[(*iter2).first]/(double)correct_ones*100;
			fout6<<"rank "<<(*iter2).first<<" : "<<per<<endl;
		}
		fout6.close();
		fout2.close();
		fout3.close();
		fout4.close();
	} 
	return 0;
}
