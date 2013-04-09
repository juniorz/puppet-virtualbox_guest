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

