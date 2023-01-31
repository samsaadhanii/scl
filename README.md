# Sanskrit Computational Linguistics Tools

The distribution contains the following tools related to Sanskrit computations developed under the guidance of Amba Kulkarni since 2002.  

1. Morph analyser
2. Morph generator
3. Sandhi joiner
4. Sandhi splitter
5. Anusaaraka Skt-Hnd MT system
6. Transliteration modules
7. Amarakosha
8. Ashtadhyayi Simulator
9. Navya-Nyaya Diagramatic Representation
10. Compound word generator
11. e-readers for Sankshepa Ramayanam and Srimad Bhagvad Gita

---

## Installation via Docker

Samsaadhanii along with its dependencies is available as a [Docker](https://www.docker.com/) image for easy installation. See [samsaadhanii-container](https://github.com/vipranarayan14/samsaadhanii-container) for installation and usage instructions.

---

## Manual Installation

**Note**: The installation instructions for Ubuntu 22.04 and newer, will be made available soon. For the other versions, follow the instructions below.

### 1. Pre-requisites:

* apache HTTP server
* bash
* bison
* flex
* graphviz
* gcc
* g++
* lttoolbox
* make
* perl
* python
* default-jdk
* timeout
* python3-pandas, python3-openpyxl, anytree, devtrans
* Ocaml, Ocamlp4 patch


```
sudo apt-get install apache2 bash bison flex graphviz gcc lttoolbox make perl python xsltproc default-jdk g++ python3-pip
sudo pip3 install pandas 
sudo pip3 install openpyxl
sudo pip3 install anytree
```

To install without python3-pip:
```
sudo apt install python3-pandas
sudo apt install python3-openpyxl
sudo apt install anytree
```

### 2. Ocaml and Ocaml patch:

For Ubuntu 20.04 and newer: *ocaml*, *ocamlbuild* and *camlp4* can be installed from apt:
```
sudo apt install ocaml ocamlbuild camlp4
```

For Ubuntu 18.04 and older: specific versions of *ocaml*, *ocamlbuild* and *camlp4* are to be installed as follows

#### 2.1 Ocaml

1. Download Objective Caml (ocaml-4.08.1.tar.gz) available at [Ocaml Releases](http://ocaml.org/releases/)
2. Extract the compressed file and run the following commands in the directory to install Ocaml:
```
./configure
make world.opt
sudo make install
```

#### 2.2 Ocamlbuild

1. Download package Ocamlbuild (ocamlbuild-0.14.0.tar.gz) available at [Ocamlbuild Releases](https://github.com/ocaml/ocamlbuild/releases)
2. Extract the compressed file and run the following commands in the directory to install Ocamlbuild:
```
make configure # beware: not ./configure
make
sudo make install
```

#### 2.3 Camlp4

1. Download Camlp4 (camlp4-4.08-1.tar.gz) available at [Camlp4 Releases](https://github.com/ocaml/camlp4/releases)
2. Extract the compressed file and run the following commands in the directory to install Camlp4:
```
./configure
make all # beware: not just make
sudo make install
```

### 3. Zen Computational Linguistics tools

```
git clone https://gitlab.inria.fr/huet/Zen.git
cd Zen/ML 
make
```

### 4. SCL tools Installation

To install Sanskrit Computational Linguistics tools from Samsaadhanii:

1. If you have already have a tar, or updated version, then skip this step.
```
git clone https://github.com/samsaadhanii/scl.git
```
2. cp SPEC/spec_users.txt file to scl directory. Name it as spec.txt
   Check that the paths are correct, else make necessary changes.
3. Run the following commands:
```
./configure 
make
sudo make install
```

### 5. Starting the server

```
sudo a2enmod cgid
sudo systemctl restart apache2
```

All the packages are available under GPL. You would have received a copy of GPL license with this package.

In case of any queries, please contact ambapradeep@gmail.com.


Amba Kulkarni  
14th Apr 2022

---

$~$

## History

$~$

* We acknowledge the help of ASR Melkote who had given their resources of Morphological Analyser in 2002. This formed a starting point for us. 

* Mr. Jain worked on the Sanskrit morphological analyser from 2002-2003 towards his M.Tech. thesis at IIIT-H.

* Ms. Sheeba worked as a part of work on her Ph.D. thesis contributed towards the development of morphological analyser from 2004-2006. Her major contribution was for subantas and kridantas.

* Dr. Anil Kumar contributed for the development of tinganta analyser between 2006-2007, especially with the Dhaturatnakar entries.

* Later from 2004-2006, various students at the Rashtriya Sanskrit Vidyapeetham Tirupati contributed to the development of Sandhi package. Contribution of Ms. Sivaja Nair, Pankaj Vyasa and Ms. Sushama Vempati deserve special mention.

* University of Hyderabad later supported further development under the University of Potential Excellence scheme from 2006-2007.

* During 2006-2008 Pawan Goyal, IIT Kanpur worked with Amba Kulkarni towards the development of Ashtadhyayi simulator.

* Though Amba Kulkarni worked on various modules at her own pace, the project got a boost when the Technology Development for Indian Languages(TDIL)  division of Ministry of Information and Communication Technology supported the activity in the form of a Consortium of 7 Institutes (2009-13).

* The Principal Investigators at the 7 institutes are:
   1. Amba Kulkarni, Department of Sanskrit Studies, University of Hyderabad (Consortium Leader)
   2. Dipti Mishra Sharma, IIIT-H, Hyderabad
   3. Girish Nath Jha, Special Center for Sanskrit, JNU, Delhi
   4. Veeranarayan Pandurangi, JRRSU, Jaipur
   5. Tirumala Kulkarni, PPVP, Bangalore
   6. S. S. Murty, RSVP, Tirupati
   7. Shrinivas Varkhedi, Director, Sanskrit Academy, Hyderabad  

* Under this project on 'Development of Sanskrit Computational tools and Sanskrit-Hindi Machine Translation system', following tools have been developed:

   1. Morph analyser
   2. Morph generator
   3. Sandhi
   4. Sandhi Splitter
   5. Sanskrit-Hindi Machine Translation system (Sampark and Anusaaraka models)
   6. Compound Processor

* All these modules were developed at the Department of Sanskrit Studies, University of Hyderabad.

* Various consortium members have contributed by developing annotated tests for building these modules. In addition JNU developed a POS tagger and IIIT-H deveoped a POS tagger and a parser, which are not part of this distribution.

* During 2015-17 Amba Kulkarni was awarded a fellowship at Indian Institute of Advanced Study, Shimla. During this period she improved the parsing algorithms taking into account the yogyataa as a constraint.

* Following persons had major contribution in the development of the tools:
   1. Dr. Sheeba
   2. Dr. Devanand Shukl
   3. Dr. Anil Kumar
   4. Ms. Bhavani
   5. Ms. Gauri
   6. Ms. Kiranmayi
   7. Mr. Karunakar
   8. Dr. Shivaja
   9. Dr. Shailaja
   10. Dr. Pavankumar Satuluri
   11. Dr. Monali Das
   12. Dr. Arjun K
   13. Dr. Preeti Shukla

* In addition, Converters and Transliteration modules for converting/transliterating from one scheme to the other are developed. Following schemes have been addressed.
   1. Unicode Devanagari (UTF-8)
   2. WX
   3. Velthuis
   4. Itrans
   5. SLP
   6. Kyoto Harvard

* Dr. Sivaja Nair worked on her Ph.D. thesis on the Amarakosha from 2007-2011. The package she developed in the process is also available for distribution.

* Dr. Anil Kumar developed the Compound processor as a part of his PhD thesis from 2008-2011.

* Dr. Shailaja developed the concordance of three Paninian Dhatuvrttis as a part of her PhD thesis from 2009-13.

* Dr. Pavankumar Satuluri developed the compound generator as a part of his PhD thesis (2011-15).

* Dr. Arjuna developed the Nyaayacitradiipikaa, an analyser for Navya Nyaya Expressions as a part of his PhD thesis (2013-17).

* Dr. Monali Das provided the Kaaraka analysis of Sankshepa Ramayanam.

* Dr. Preeti Patel (Shukl) developed the e-reader for SrimadBhagvadGeeta.

* Dr. Anupama Ryali developed the e-reader for Shishupalavadham as a part of her Post Doctoral Fellowship.

* Since 2007 Amba Kulkarni is also collaborating with Gérard Huet, INRIA. As a result of this collaboration, an inter-communication between the Sanskrit Heritage tools and the Anusaaraka tools has been possible.

* Finally I would like to acknowledge Prof. K V Ramkrishnamacharyulu for his guidance throughout the development of these tools.

---
