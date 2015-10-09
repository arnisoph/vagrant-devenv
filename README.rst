==============
vagrant-devenv
==============

.. image:: https://img.shields.io/badge/donate-flattr-red.svg
    :alt: Donate via flattr
    :target: https://flattr.com/profile/bechtoldt

.. image:: https://img.shields.io/gratipay/bechtoldt.svg
    :alt: Donate via Gratipay
    :target: https://www.gratipay.com/bechtoldt/

.. image:: https://img.shields.io/badge/license-Apache--2.0-blue.svg
    :alt: Apache-2.0-licensed
    :target: https://github.com/bechtoldt/vagrant-devenv/blob/master/LICENSE

.. image:: https://img.shields.io/badge/chat-gitter-brightgreen.svg
    :alt: Join Gitter Chat
    :target: https://gitter.im/bechtoldt/vagrant-devenv?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge

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

* See `assets/ <https://github.com/bechtoldt/vagrant-assets>`_


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

* set ``headless`` to ``false`` in your packer user variable file
* build image with debug param ``-var debug_provision=yes``, this causes a long sleep at the end of image provisioning so that you can log into the machine


Additional resources
--------------------

* Test scripts: https://github.com/bechtoldt/vagrant-devenv-test

.. image:: https://asciinema.org/a/18109.png
    :target: https://asciinema.org/a/18109
