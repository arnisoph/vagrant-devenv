==============
vagrant-devenv
==============

.. image:: http://img.shields.io/github/tag/bechtoldt/vagrant-devenv.svg
    :target: https://github.com/bechtoldt/vagrant-devenv/tags

.. image:: https://api.flattr.com/button/flattr-badge-large.png
    :target: https://flattr.com/submit/auto?user_id=bechtoldt&url=https%3A%2F%2Fgithub.com%2Fbechtoldt%2Fvagrant-devenv

Environment setup using Vagrant for infrastructure hacking and development

.. contents::
    :backlinks: none
    :local:


Requirements
------------

You need:

* basic packer/ vagrant knowledge (RFTM skills are sufficient)
* Internet connection (at least for the initial creation of your vagrant boxes)
* Vagrant >= 1.6.5 (``$ vagrant -v``)
* Packer >= v0.7.5 (``$ packer version``)


Supported Platforms
-------------------

Host Operating Systems:

* OS X 10.9.5

Guest Operating systems:

* GNU/ Linux Debian 7
* CentOS 7

Vagrant providers:

* VirtualBox (>= 4.3.22, Oracle VM VirtualBox Extension Pack >= 4.3.22)

Vagrant provisioners:

* Salt (or custom provisioner?)


Files & Directories
-------------------

::

    |-- README.rst
    |-- Vagrantfile.template          # Default Vagrantfile for every Vagrant box
    |-- configs/                      # Default user variable files for packer
    |   `-- centos-7/
    |-- scripts/                      # Scripts that are used for image provisioning
    |   `-- rhel/
    |-- shared/
    |   `-- boxes/                    # Created Vagrant boxes will be placed here
    `-- templates/
        `-- centos-7/                 # A packer template directory
            |-- public_html/
            `-- template.json         # Packer template


Deploying a minimal Vagrant box
-------------------------------

Starting conditions
'''''''''''''''''''

* ~/dev/vagrant-devenv/     (clone of this Git repo)
* ~/dev/my-project/         (any project Git repo or directory)

TODO: complete sect

Create the base box
'''''''''''''''''''

Clone this Git repository (vagrant-devenv) to your local workstation.

Prepare your image config or use an exiting one, e.g. ``configs/centos-7/minimal.json``

Validate config syntax:

::

    $ packer validate \
        -var release="0.1" \
        -var headless=false \
        -only=virtualbox \
        -var-file=configs/centos-7/minimal.json \
        templates/centos-7/template.json

Build image for Vagrant:

::

    $ packer build \
        -var release="0.1" \
        -var headless=false \
        -only=virtualbox \
        -var-file=configs/centos-7/minimal.json \
        templates/centos-7/template.json

If everything went well you'll find a new Vagrant box in ``shared/boxes/``:

::

  $ find shared/boxes -type f
  shared/boxes/DEV_CentOS_70_min-virtualbox-0.1.box


See ``build-boxes`` file how to build all images.


Instantiate the Vagrant box
'''''''''''''''''''''''''''
FIXME


Troubleshooting
---------------

In case of any errors during image/ box creation, keep cool and follow the
following steps:

Packer
''''''

* set ``headless`` to "true" in your packer user variable file
* build image with debug param ``-var debug_provision="yes"``, this causes a long sleep at the end of image provisioning so that you can log into the machine


Additional resources
--------------------

None


TODO
----

* support puppet?
* add LICENSE file
