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

If you have already Anaconda Navigator GUI, to install the OmniSci Data Science stack, we recommend you to import a new environment from this [example](https://github.com/Quansight/omnisci-examples). You can download all the repository or you can just download the environment.yml file. For now, we will download just the environment file, but feel free to download all the repository and play with the examples there:

```sh
wget https://raw.githubusercontent.com/Quansight/omnisci-examples/master/environment.yml -O /tmp/environment.yml
```

Now, open your Anaconda Navigator, and click on the `Environments` menu. To create a new environment from the file you just download, click on the `Import`. It will open a window requesting information about the new environment. Set the name for your new environment, select the environment file located at `/tmp/environment.yml` and click on the `Import` button.

Now you can access the OmniSci Data Science stack using the new environment you just created!

## Using the OmniSci Mac Preview

If you already have [Mac Preview](https://www.omnisci.com/mac-preview) and you want to connect to that from your jupyter-lab notebook, first open your jupyter-lab instance. From the command line, go to the folder you want as root for your notebooks (or use --notebook-dir with the path of your desired folder) and call the `jupyter-lab` command, for example:

```sh
# $HOME is a variable that points to the path of you user folder
mkdir $HOME/notebooks
cd $HOME/notebooks
jupyter-lab
```

To create a new notebook for Python code, click on the Python 3 icon inside `Launcher` page. If `Launcher` page is not showing, click first on the `+` icon on ther left corner near the menu bar:

![jupyter-lab lancher page](https://user-images.githubusercontent.com/5209757/95106626-bd2d6880-0706-11eb-8d61-b76cbdf5b253.png)

OmniSci Data Science installer installs automatically, among other packages, jupyterlab, ibis and pymapd. As default, OmniSci Mac Preview server listen to the port 16274. So, let's try to connect to the OmniSci Mac Preview and get the name of all tables available there!

Add the following code at the first cell of you notebook:

```sh
# import ibis-framework package
import ibis
# connect to OmniSci Mac Preview
client = ibis.omniscidb.connect(
    host="localhost",
    port="16274",
    database="omnisci", 
    user="admin",
    password="HyperInteractive", 
)
# get the name of all tables available
client.list_tables()
```

Now, run that and check if it returns the follow result:

```sh
['omnisci_states',
 'omnisci_counties',
 'omnisci_countries',
 'flights_2008_7M',
 'us_counties_covid_cases_enriched']
```

If it is not working, check if you did all the previous step according to the instructions. If the problem persists, we encourage you to open an [issue](https://github.com/Quansight/omnisci-datascience-installer/issues) with all the details about your problem.

If it worked, congratulations! Your environment is working properly and you can start to play with OmniSci Data Science tools by yourself! Have fun!
