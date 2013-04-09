#
class virtualbox::guest_additions(
  $version = nil, $ensure = 'sync'
){

  if($ensure == 'sync'){
    $install_version = $::virtualbox_host_version
  } else {
    $install_version = $version
  }

  # TODO compare versions and only install if older
  if($install_version != $::virtualbox_guest_additions){
    $file_name = "VBoxGuestAdditions_${install_version}.iso"
    $dest_file = "/tmp/${file_name}"

    file { '/root/install_guest_additions' :
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0754',
      source => 'puppet:///modules/virtualbox/install_guest_additions.sh',
    }

    exec { 'install_guest_additions' :
      command  => "/bin/bash /root/install_guest_additions ${install_version}",
      user     => 'root',
      requires => File['/root/install_guest_additions'],
    }
  }
}
