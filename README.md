# omnisci-datascience-installer
Installer configuration for OmniSci stack

## Setup

There are a couple of things to do to get started here.

1. First install constructor:

```sh
conda install constructor
```

Also, you can install the dependencies from the environment-dev.yml file:

```sh
conda env create -n omnisci-ds-installer --file environment-dev.yml
```

This command creates an environment called `omnisci-ds-installer` (you can use
another name if you want) and installs the packages listed in `environment-dev.yml`.

2. Second, grab a copy of conda-standalone that you want to use.
   It is sometimes the case (especially on Windows) that the versions of
   conda-standalone that come when you install constructor (from step 1)
   are actually pretty broken. It is more stable to rely on the official
   standalone releases. These can be found at https://repo.anaconda.com/pkgs/misc/conda-execs/
   You'll want to grab a recent version of one of these and stash it somewhere.
   For example:

```sh
wget https://repo.anaconda.com/pkgs/misc/conda-execs/conda-latest-osx-64.exe
```

3. On Mac, building pkg installers can often result in using too many file handles.
   To get around this, please run the following commands. Note that you will need
   have root access for some of these:

```sh
# perform as regular user
ulimit -S -n 204800

# perform as root
sudo sysctl -w kern.maxfiles=204800
sudo sysctl -w kern.maxfilesperproc=245670
```


## Running Constructor

Now you may run constructor with the following command:

```sh
constructor --conda-exe /path/to/conda.exe constructor/
```

Be aware that, on Mac, whether you are creating a sh-based or pkg-based installer
depends on the contents of the `constructor/construct.yaml` file.  Simply change
the `installer_type` key to have a value of `pkg` or `sh` depending on what you want.

## Gotchas

The pkg installer seems to need to have `conda` itself listed as a spec right now.


## Releasing

For releasing, after the PR is merged, create a tag with the last commit from master and 
push it to the repository, for example:

```sh
git fetch upstream
git checkout upstream/master
rever check
rever 0.0.3
```


## Installation

OmniSci Data Science package installs OmniSci stack that includes intake/intake-omnisci, omnisci-pytools, pymapd, ibis-framework, etc.


### MacOS Instructions

Follow the instructions below for your current setup:

**If you have no conda installed on your machine**  
IMPORTANT: If you already have conda installed, this will overwrite the conda path in your bash profile!! Follow other instructions instead.

The OmniSci Data Science Installer can be installed using a shell script if you have no conda on your machine. The shell installers for each version of the package are available on the GitHub  [releases page](https://github.com/Quansight/omnisci-datascience-installer/releases/). For each release, you will find both a MacOS package (`pkg`) and a shell (`sh`) installer. 


NOTE: The MacOS package installer is not ready ???

To run the shell installer:

First, download the shell package (`omnisci-<release_ver>-MacOSX-x86_64.sh`) `omnisci-datascience-installer` [release page](https://github.com/Quansight/omnisci-datascience-installer/releases/) and add execution permission to it:

Download the installer and ensure that you have execution permission for the package. 
```sh
wget https://github.com/Quansight/omnisci-datascience-installer/releases/download/0.0.2/omnisci-0.0.2-MacOSX-x86_64.sh
chmod +x omnisci-0.0.2-MacOSX-x86_64.sh
```

Now you can install it by executing the script. If you'd prefer to install it without manual intervention, you can execute it with the `-b` flag.
```sh
./omnisci-0.0.2-MacOSX-x86_64.sh -b
```
Otherwise, you can execute the shell script with no flags:

```sh
./omnisci-0.0.2-MacOSX-x86_64.sh
```


You can scroll through the license agreement by hitting enter or spacebar. If you'd like to skip to the end, you can select `q`

Once you have agreed the the license agreement and the install location, the installer will unpack all the required packages into the the install location. 

You will see that your `bash` profile has been modified to include the conda path. In order to utilize conda, you'll need to either close and reopen your terminal, or you can source this updated file.  

```sh
source .bash_profile
```

You have successfully installed the OmniSci Datascience Installer on your Mac in the `base` conda environment. This environment has already been activated for you. You are now ready to run some examples! 


**If you already have conda installed:**

If you already have Conda installed on your Mac, you can create the OmniSci environment directly. These instructions provide the zip example, but you could also use git commands to download the repository. 

Download the repository. A separate zip file is available for each version (e.g. we're downloading v0.1.0 here). 

```sh
wget https://github.com/Quansight/omnisci-examples/archive/v0.1.0.zip
```
Unpack the zip file and navigate to the root of the package.
```sh
unzip v0.1.0.zip
cd omnisci-examples-0.1.0
```

Create a new conda environment. This will download all the necessary packages. 
```sh
conda env create -f environment.yml -n omnisci
```
Activate the new enviroment (requires you to have run `conda init`)
```sh
conda activate omnisci
```
You have successfully installed the OmniSci Datascience Installer on your Mac in the `omnisci` conda environment. You are now ready to run some examples! 



**If you have the Anaconda Navigator GUI**


## Using the OmniSci Mac Preview
