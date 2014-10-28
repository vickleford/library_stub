require 'chefspec'
require 'chefspec/berkshelf'
require 'fauxhai'

RSpec.configure do |config|
  config.platform = 'ubuntu'
  config.version = '14.04'
  
  config.before(:each) do
    Fauxhai.mock(platform: config.platform, version: config.version)
    
    allow(::Kernel).to receive(:system).with('ping -c 1 -w 2 10.10.4.48 > /dev/null').and_return(true)
    
    stub_search("node", "some:stuff")
      .and_return([{"name" => "unit.localdomain", "automatic" => {"ipaddress" => "10.10.4.48"}}])
  end
end

def base_run()
  @runner ||= ChefSpec::Runner.new do |node|
    # init
  end.converge(described_recipe)
end
