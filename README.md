# virtualbox

Provides helpful defnitons to help you manage your VirtualBox Guests
(like your Vagrant boxes, for instance).

## Usage

### virtualbox::guest_additions

Installs VirtualBox Guest Additions

    class { 'virtualbox::guest_additions':
      ensure => sync,
    }

Keeps the Guest Additions at the same version as the VirtualBox Host.

You can also stick it to a specific version with:

    class { 'virtualbox::guest_additions':
      version => '4.2.10',
    }

### Facts

This module provides the following facts:

`virtualbox_guest_additions` - the version of VirtualBox Guest Additions
currently installed.

`virtualbox_host_version` - the version of VirtualBox instaled in the Host.o

## Related projects

* https://github.com/dotless-de/vagrant-vbguest  
  Manages VirtualBox Guest Additions automatically for Vagrant boxes.

