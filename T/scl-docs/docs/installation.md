# Installation

## Pre-requisites

- GNU/Linux OS
- Apache HTTP Server
- Bash
- Bison
- Flex
- Graphviz
- GCC
- G++
- Lttoolbox
- Make
- Perl
- Python3
- xsltproc
- Java Development Kit
- Ocaml (v4.07 or v4.08)
    - ocamlbuild
    - camlp4 patch
    - Zen Computational Linguistics Toolkit

### Installing Prerequisites in Debian/Ubuntu

Prerequisites (except Ocaml) may be installed from the official repositories of Debian/Ubuntu derivatives using the following command.

```bash
sudo apt install apache2 bash bison flex graphviz gcc g++ lttoolbox make perl python3 xsltproc default-jdk
```

Enable `cgi` module in Apache and restart the server.

```bash
sudo a2enmod cgid
sudo service apache2 restart
```

### Installing Ocaml

Official repositories of Ubuntu 20.04, Debian Bullseye and Sid include compatible versions of `ocaml`, `ocamlbuild` and `camlp4`. They may be installed using `apt` command. In other Linux OSs/distros, it is recommended to install Ocaml dependencies from the sources, as described below.

#### Ocaml

v.4.08+ -- [https://github.com/ocaml/ocaml/archive/4.08.0.tar.gz](https://github.com/ocaml/ocaml/archive/4.08.0.tar.gz)

```bash
./configure
make world.opt
sudo make install
```

#### Ocamlbuild

v0.14.0 -- [https://github.com/ocaml/ocamlbuild/archive/0.14.0.tar.gz](https://github.com/ocaml/ocamlbuild/archive/0.14.0.tar.gz)

```bash
make configure  # beware: not ./configure
make
sudo make install
```

#### Camlp4

v.4.08.1 -- [https://github.com/camlp4/camlp4/archive/4.08+1.tar.gz](https://github.com/camlp4/camlp4/archive/4.08+1.tar.gz)

```bash
./configure
make all  # beware: not just make
sudo make install
```

#### Zen Toolkit
```bash
git clone https://gitlab.inria.fr/huet/zen.git
cd zen/ML
make
```

## Installing Samsaadhanii

- **Clone** Samsaadhanii sources from the Git server.
```
git clone http://scl.samsaadhanii.in:3000/amba/scl.git
```

- **Copy** `scl/SPEC/spec_users.txt` file to `scl/` directory.
- **Rename** it as `spec.txt`.
- **Edit** the paths in the spec file, if necessary.

- **Compile and install** the sources using the following commands.
```bash
./configure
make
sudo make install
```

All the packages are available under GPL. You would have received a copy of GPL license with this package.

In case of any queries, please contact [ambapradeep@gmail.com](mailto:ambapradeep@gmail.com)
