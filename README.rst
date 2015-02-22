
==============
vagrant-devenv
==============

.. image:: https://api.flattr.com/button/flattr-badge-large.png
    :target: https://flattr.com/submit/auto?user_id=bechtoldt&url=https%3A%2F%2Fgithub.com%2Fbechtoldt%2Fvagrant-devenv

Generic environment setup using Vagrant for infrastructure hacking and development

.. contents::
    :backlinks: none
    :local:

Credits
-------

FIXME

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


Deploying a minimal vagrant box
-------------------------------

Prepare the box
'''''''''''''''

Clone this Git repository (vagrant-devenv) to you local workstation.

Prepare your image config or use an exiting one, e.g. ``configs/centos-7-minimal.json``

Validating config syntax:

  $ packer validate \
  -var release='foo' \
  -only=virtualbox \
  -var-file=configs/centos-7-minimal.json \
  boxes/centos-7/template.json

Build the image for vagrant:

  $ packer build -var release='foo' \
  -only=virtualbox \
  -var-file=configs/centos-7-minimal.json \
  boxes/centos-7/template.json

This will take a long time now..




Additional resources
--------------------

None

TODO
----

* use travis CI to test bootstrap?
* support puppet?
