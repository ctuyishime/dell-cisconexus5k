cisconexus5k_portchannel {
  "200":
    ensure                => "present",
    untagged_vlan         => "20",
    tagged_vlan           => "99,17",
    mtu                   => "9216",
    removeallassociatedvlans => "true",
    speed                 => "10000",
    istrunkforportchannel => "true",
    vpc                   => "200"

}

cisconexus5k_interface {
  "Eth1/5":
    ensure                   => "present",
    switchport_mode          => "trunk",
    shutdown                 => 'false',
    removeallassociatedvlans => "true",
    port_channel             => '200',
    tagged_general_vlans     => '99,17',
    untagged_general_vlans   => '20',
    mtu                      => '9216',
    speed                    => '10000'

}

cisconexus5k_interface {
  "Eth1/6":
    ensure                   => "present",
    switchport_mode          => "trunk",
    shutdown                 => 'false',
    removeallassociatedvlans => "true",
    port_channel             => '200',
    tagged_general_vlans     => '99,17',
    untagged_general_vlans   => '20',
    mtu                      => '9216',
    speed                    => '10000'

}

cisconexus5k_vlan {
  '99':
    ensure => "present"
}

cisconexus5k_vlan {
  '17':
    ensure => "present"
}

cisconexus5k_vlan {
  '20':
    ensure => "present"
}
