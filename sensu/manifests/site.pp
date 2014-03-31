#default node defition
node default {

}

#Puppet master node definition
node 'sensumaster.local' {

  class { 'puppetdb':
    listen_address => '0.0.0.0'
  }
  
  include puppetdb::master::config

  #This module is from: https://github.com/saz/puppet-ssh
  include ssh
  
  class { 'rsyslog::server': }
 
}

#Ubuntu sensu server
node 'monitor.local' {

  class { 'rsyslog::client':
    log_remote     => true,
    remote_type    => 'tcp',
    log_local      => true,
    log_auth_local => true,
    custom_config  => undef,
    server         => 'sensumaster.local',
    port           => '514',
  }

  #This module is from: https://github.com/saz/puppet-ssh
  include ssh  

}

#Ubuntu sensu node
node 'sensu1.local' {

  class { 'rsyslog::client':
    log_remote     => true,
    remote_type    => 'tcp',
    log_local      => true,
    log_auth_local => true,
    custom_config  => undef,
    server         => 'sensumaster.local',
    port           => '514',
  }

  #This module is from: https://github.com/saz/puppet-ssh
  include ssh  

}

#Ubuntu sensu node
node 'sensu2.local' {

  #This module is from: https://github.com/saz/puppet-ssh
  include ssh

  class { 'rsyslog::client':
    log_remote     => true,
    remote_type    => 'tcp',
    log_local      => true,
    log_auth_local => true,
    custom_config  => undef,
    server         => 'sensumaster.local',
    port           => '514',
  }

}

#Ubuntu sensu node
node 'sensu3.local' {

  #This module is from: https://github.com/saz/puppet-ssh
  include ssh

  class { 'rsyslog::client':
    log_remote     => true,
    remote_type    => 'tcp',
    log_local      => true,
    log_auth_local => true,
    custom_config  => undef,
    server         => 'sensumaster.local',
    port           => '514',
  }

}

#Ubuntu sensu node
node 'sensu4.local' {

  #This module is from: https://github.com/saz/puppet-ssh
  include ssh

  class { 'rsyslog::client':
    log_remote     => true,
    remote_type    => 'tcp',
    log_local      => true,
    log_auth_local => true,
    custom_config  => undef,
    server         => 'sensumaster.local',
    port           => '514',
  }

}