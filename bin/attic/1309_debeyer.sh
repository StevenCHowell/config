sudo apt-get install gawk
sudo apt-get install libcr-dev mpich2 mpich2-doc
sudo apt-get install libbz2-1.0 libbz2-dev libbz2-ocaml libbz2-ocaml-dev
./configure --enable-mpi
make
sudo make install
