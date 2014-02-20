require 'spec_helper'

describe 'nsclient', :type => :class do

  let(:facts) { {
      :osfamily  => 'Windows'
  } }
  let(:params) {{
      :package_source_location => 'http://files.nsclient.org/stable',
      :package_version         => 'NSCP-0.4.1.101-x64.msi'
  }}

  it { should compile.with_all_deps }
  it { should contain_class('nsclient::install').that_comes_before('nsclient::config') }
  it { should contain_class('nsclient::service').that_subscribes_to('ncslient::config') }










  #describe 'when single value array of allowed hosts' do
  #  let(:title) { 'test' }
  #  let(:facts) {{
  #    :operatingsystem => 'Windows',
  #    :architecture    => 'x64',
  #  }}
  #  let(:params) {{ :allowed_hosts => ['172.16.0.3'], :service_state => 'running', :service_enable => 'true' }}

  #  it { should contain_file('C:\Program Files\NSClient++\nsclient.ini').with_content(/allowed hosts = 172\.16\.0\.3/) }
  #end

  #describe 'when multi value array of allowed hosts' do
  #  let(:title) { 'test' }
  #  let(:facts) {{
  #      :operatingsystem => 'Windows',
  #      :architecture    => 'x64',
  #  }}
  #  let(:params) {{ :allowed_hosts => ['10.21.0.0/22','10.21.4.0/22'], :service_state => 'running', :service_enable => true }}

  #  it { should contain_file('C:\Program Files\NSClient++\nsclient.ini').with_content(/allowed hosts = 10\.21\.0\.0\/22,10\.21\.4\.0\/22/) }
  #end
end
