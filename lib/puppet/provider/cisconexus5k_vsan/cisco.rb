require 'puppet/provider/cisconexus5k'

Puppet::Type.type(:cisconexus5k_vsan).provide :cisconexus5k, :parent => Puppet::Provider::Cisconexus5k do

  desc "Cisco switch/router provider for vsan."

  mk_resource_methods

  def self.get_current(name)
    vlans = {}
    transport.command do |dev|
      vlans = dev.parse_vsans || {}
    end
    vlans[name]
  end

  # Clear out the cached values.
  def flush
    transport.command do |dev|
      vsanname = (resource[:vsanname] || '' )
      membership = ( resource[:membership] || '' )
      membershipoperation = (resource[:membershipoperation] || 'add' )
      fcoemap = (resource[:fcoemap] || '')  
      ensureabsent = resource[:ensure]
      dev.update_vsan(resource[:name], former_properties, properties, vsanname, membership, membershipoperation, fcoemap, ensureabsent)
    end
    super
  end
end
