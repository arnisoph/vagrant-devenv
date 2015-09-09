==============
vagrant-devenv
==============

.. image:: http://img.shields.io/github/tag/bechtoldt/vagrant-devenv.svg
    :target: https://github.com/bechtoldt/vagrant-devenv/tags

.. image:: http://issuestats.com/github/bechtoldt/vagrant-devenv/badge/issue
    :target: http://issuestats.com/github/bechtoldt/vagrant-devenv

.. image:: https://api.flattr.com/button/flattr-badge-large.png
    :target: https://flattr.com/submit/auto?user_id=bechtoldt&url=https%3A%2F%2Fgithub.com%2Fbechtoldt%2Fvagrant-devenv

Environment setup using Vagrant for infrastructure hacking and development

.. contents::
    :backlinks: none
    :local:


Requirements
------------

You need:

* basic packer/ vagrant knowledge (RTFM skills are sufficient)
* Internet connection (at least for the initial creation of your vagrant boxes)
* Vagrant >= 1.6.5 (``$ vagrant -v``)
* Packer >= v0.7.5 (``$ packer version``)


Supported Platforms
-------------------

Host Operating Systems:

* OS X 10.9
* OS X 10.10

Guest Operating systems:

* GNU/ Linux Debian 7
* GNU/ Linux Debian 8
* CentOS 6
* CentOS 7

Vagrant providers:

* VirtualBox (>= 4.3.22, Oracle VM VirtualBox Extension Pack >= 4.3.22)

Vagrant provisioners:

* See https://github.com/bechtoldt/vagrant-assets


Files & Directories
-------------------

::

    $ tree -I '.git|.vagrant|.*\.swp|packer_cache' --matchdirs
    .
    ├── Vagrantfile.template          # Default Vagrantfile for every Vagrant box
    ├── assets
    │   ├── scripts                   # Scripts that are used for image provisioning
    ├── build-boxes
    ├── configs                       # Default user variable files for packer
    │   ├── centos-7
    │   │   ├── minimal.json
    ├── shared                        # Created Vagrant boxes will be placed here
    │   └── boxes
    ├── templates
    │   ├── centos-7                  # A packer template directory
    │   │   ├── public_html
    │   │   │   └── ks.cfg
    │   │   └── template.json         # Packer template
    └── update-docs


Deploying a minimal Vagrant box
-------------------------------

Create the base box
'''''''''''''''''''

::

    # Clone this Git repository (vagrant-devenv) to your local workstation
    mkdir -p ~/dev/vagrant_hacking/ && cd ~/dev/vagrant_hacking/
    git clone https://github.com/bechtoldt/vagrant-devenv.git --recursive
    cd vagrant-devenv/

    # Run the following to use some sane default:
    ./build-boxes centos7

    # If everything went well you'll find a new Vagrant box in shared/boxes/:
    ls -l shared/boxes/


Instantiate the Vagrant box
'''''''''''''''''''''''''''

::

    # Clone test Git repository (vagrant-devenv-test) to your local workstation
    mkdir -p ~/dev/vagrant_hacking/ && cd ~/dev/vagrant_hacking/
    git clone https://github.com/bechtoldt/vagrant-devenv-test.git
    cd vagrant-devenv-test/

    # Execute one of the 'init' scripts
    ./init.Debian_78_min


Troubleshooting
---------------

In case of any errors during image/ box creation, keep cool and follow the
following steps:

Packer
''''''

* set ``headless`` to "true" in your packer user variable file
* build image with debug param ``-var debug_provision=yes``, this causes a long sleep at the end of image provisioning so that you can log into the machine


Additional resources
--------------------

* Test scripts: https://github.com/bechtoldt/vagrant-devenv-test

.. image:: https://asciinema.org/a/18109.png
    :target: https://asciinema.org/a/18109


TODO
----

* support libvirt/ KVM provider https://github.com/pradels/vagrant-libvirt/
