Facter.add(:virtualbox_guest_additions) do
  confine :kernel => 'Linux'
  confine :virtual => 'virtualbox'
  setcode do
    Facter::Util::Resolution.exec("sudo /usr/bin/VBoxControl --nologo guestproperty get /VirtualBox/GuestAdd/Version | /usr/bin/cut -d' ' -f 2")
  end
end

Facter.add(:virtualbox_host_version) do
  confine :kernel => 'Linux'
  confine :virtual => 'virtualbox'
  setcode do
    Facter::Util::Resolution.exec("sudo /usr/bin/VBoxControl --nologo guestproperty get /VirtualBox/HostInfo/VBoxVer | /usr/bin/cut -d' ' -f 2")
  end
end
