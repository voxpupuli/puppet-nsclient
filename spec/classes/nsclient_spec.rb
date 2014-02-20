require 'spec_helper'

describe 'nsclient', :type => :class do

  let(:facts) { {
      :osfamily  => 'Windows'
  } }
  let(:params) {{
      :package_source_location => 'http://files.nsclient.org/stable',
      :package_version         => 'NSCP-0.4.1.101-x64.msi'
  }}

  it { should contain_class('nsclient::install').that_comes_before('nsclient::service') }


  context 'using params defaults' do
    it { should contain_class('nsclient') }
    it { should contain_package('NSCP-0.4.1.101-x64.msi')
                          .with_ensure('installed')
                          .with_source('http://files.nsclient.org/stable/NSCP-0.4.1.101-x64.msi')
        }
    it { should contain_service('nscp').with_ensure('running') }

  end

  context 'installing a custom version' do

    let(:params) { {'package_version' => 'NSCP-Custom-build.msi', 'package_source_location' => 'http://myproxy.com:8080' } }

    it { should contain_package('NSCP-Custom-build.msi')
                    .with_ensure('installed')
                    .with_source('http://myproxy.com:8080/NSCP-Custom-build.msi')
    }

  end

  context 'when trying to install on Ubuntu' do
    let(:facts) { {:osfamily => 'Ubuntu'} }
    it do
      expect {
        should contain_class('nsclient')
      }.to raise_error(Puppet::Error, /^This module only works on Windows based systems./)
    end
  end

  context 'with service_state set to stopped' do
    let(:params) { {'service_state' => 'stopped'} }

    it { should contain_service('nscp').with_ensure('stopped') }
  end

  context 'with service_enable set to false' do
    let(:params) { {'service_enable' => 'false'} }

    it { should contain_service('nscp').with_enable('false') }
  end

  context 'with service_enable set to true' do
    let(:params) { {'service_enable' => 'true'} }

    it { should contain_service('nscp').with_enable('true') }
  end








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
