require 'spec_helper'

describe 'nsclient', :type => :class do
  describe 'when single value array of allowed hosts' do
    let(:title) { 'test' }
    let(:facts) {{
      :operatingsystem => 'Windows',
      :architecture    => 'x64',
    }}
    let(:params) {{ :allowed_hosts => ['172.16.0.3'] }}

    it { should contain_file('C:\Program Files\NSClient++\nsclient.ini').with_content(/allowed hosts = 172\.16\.0\.3/) }
  end

  describe 'when multi value array of allowed hosts' do
    let(:title) { 'test' }
    let(:facts) {{
        :operatingsystem => 'Windows',
        :architecture    => 'x64',
    }}
    let(:params) {{ :allowed_hosts => ['10.21.0.0/22','10.21.4.0/22'] }}

    it { should contain_file('C:\Program Files\NSClient++\nsclient.ini').with_content(/allowed hosts = 10\.21\.0\.0\/22,10\.21\.4\.0\/22/) }
  end
end
