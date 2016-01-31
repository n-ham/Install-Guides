# NOTE: this is NOT intended to be run as a script!
#
# explanation: steps I follow when installing gap on ubuntu.
#
# at some point I may turn this into a runnable script, though would still 
# advise going through the steps manually to identify any issues.
#

version=4r7

#### Before Installation ####
#download latest tar.gz release from:
    #http://www.gap-system.org/Releases/index.html

sudo apt-get install m4
sudo apt-get install libreadline6-dev
sudo apt-get install libncurses5-dev
sudo apt-get install libxaw7-dev

#check gmp is installed in /usr/local/lib/gmp
#installing gmp properly otherwise
#download latest gmp-VERSION.tar.bz2 from https://gmplib.org/#DOWNLOAD
cd ~/Downloads                    #change to downloads dir
tar -xvf gmp-*.tar.bz2            #extract gmp
cd gmp*                           #change to extracted gmp dir
./configure --prefix=/usr/local/lib/gmp #configure makefile
make                              #build gmp
sudo make install                 #install gmp

#### installation #### 
cd ~/Downloads                    #change to downloads dir
tar -xvf temp.tar.gz              #extract gap
sudo mv gap* /usr/local/lib/      #move files to gap to install path
cd /usr/local/lib/gap             #change to install dir
./configure --with-gmp=/usr/local/lib/gmp #configure makefile
make                              #build gap
#copy symbolic link to gap script into /usr/local/bin
sudo cp /usr/local/lib/gap${version}/bin/gap.sh /usr/local/bin/gap


#### (optional) test installation ####
gap  <<EOF
	Read( Filename( DirectoriesLibrary( "tst" ), "testinstall.g" ) );
	quit;
EOF

#### after installation ####
#gap packages
#IO
cd /usr/local/lib/gap${version}/pkg/io-*
./configure
make 


#following packages (in my experience) don't need manual install
#Orb, genss, GRAPE, Semigroups, Smallsemi

#### setting up default workspace ####
## if anything fails to load go and install manually like with io ##
gap <<EOF
	LoadPackage("IO");
	LoadPackage("Orb");
	LoadPackage("genss");
	LoadPackage("GRAPE");
	LoadPackage("Semigroups");
	LoadPackage("Smallsemi");
	SaveWorkspace("/usr/local/lib/gap${version}/bin/default-workspace");
	quit;
EOF

## add alias so gap runs using default workspace ##
nano ~/.bash_aliases
#add 'alias gap="gap -L /usr/local/lib/gap${version}/bin/default-workspace/"'
#run 'alias | grep gap' in new terminal window to ensure it worked properly
#to run using default workspace enter 'gap'
#to run using no workspace enter '\gap'
