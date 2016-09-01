require 'spec_helper'

describe file('/etc/yum.repos.d/Nux_Dextop.repo') do
  it { should be_file }
end

describe file('/var/log/deluge') do
  it { should be_directory }
end

describe yumrepo('Nux_Dextop') do
  it { should exist }
end

describe yumrepo('Nux_Dextop') do
  it { should be_enabled }
end

describe package('deluge') do
  it { should be_installed }
end

describe package('deluge-web') do
  it { should be_installed }
end

describe port(8112) do
  it { should be_listening }
end

describe port(58846) do
  it { should be_listening }
end

describe user('deluge') do
  it { should exist }
end

describe group('deluge') do
  it { should exist }
end

describe user('deluge') do
  it { should belong_to_group 'deluge' }
end

describe user('deluge') do
  it { should belong_to_primary_group 'deluge' }
end

describe user('deluge') do
  it { should have_login_shell '/sbin/nologin' }
end

describe process("deluged") do
  it { should be_running }
end
