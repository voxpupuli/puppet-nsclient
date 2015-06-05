require 'rubygems'
require 'open-uri'

module Puppet::Parser::Functions
  newfunction(:resolve_nscp_package_source, :type => :rvalue) do |args|
    version = args[0]
    arch = args[1]

    vhost = 'files.nsclient.org'

    page = open("http://#{vhost}/released/").read
    links = page.scan(/href="(\S+)"/)
    strings = links.collect{ |l| l.join("") }
    candidates = strings.select {|l| l =~ /#{arch}.msi$/ }

    if version == 'latest'
      filename = candidates.last
    else
      filename = candidates.find { |e| /#{version}/ =~ e }
    end

    return filename
  end
end
