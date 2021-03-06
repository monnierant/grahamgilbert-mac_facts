# mac_java_version.rb

require 'puppet/util/plist'

Facter.add(:mac_java_version) do
  confine kernel: 'Darwin'
  setcode do
    begin
      Puppet::Util::Plist.read_plist_file('/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Info.plist')['CFBundleVersion']
    rescue Errno::ENOENT
      nil
    end
  end
end
