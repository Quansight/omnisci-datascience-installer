# omnisci-datascience-installer
Installer configuration for OmniSci stack

## Setup

There are a couple of things to do to get started here.

1. First install constructor:

```sh
conda install constructor
```

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