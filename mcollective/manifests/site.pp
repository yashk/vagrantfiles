#default node defition
node default {

}

#Puppet master node definition
node 'mcomaster.local' {

  class { 'puppetdb':
    listen_address => '0.0.0.0'
  }
  
  include puppetdb::master::config

  include ssh
  
  class { 'rsyslog::server': }
 
}

#Ubuntu Mcollective node
node 'mco1.local' {

  class { 'rsyslog::client':
    log_remote     => true,
    remote_type    => 'tcp',
    log_local      => true,
    log_auth_local => true,
    custom_config  => undef,
    server         => 'mcomaster.local',
    port           => '514',
  }

  include ssh  

}

#Ubuntu Mcollective node
node 'mco2.local' {

  include ssh

  class { 'rsyslog::client':
    log_remote     => true,
    remote_type    => 'tcp',
    log_local      => true,
    log_auth_local => true,
    custom_config  => undef,
    server         => 'mcomaster.local',
    port           => '514',
  }

}

#Ubuntu Mcollective node
node 'mco3.local' {

  include ssh

  class { 'rsyslog::client':
    log_remote     => true,
    remote_type    => 'tcp',
    log_local      => true,
    log_auth_local => true,
    custom_config  => undef,
    server         => 'mcomaster.local',
    port           => '514',
  }

}

#Ubuntu Mcollective node
node 'mco4.local' {

  include ssh

  class { 'rsyslog::client':
    log_remote     => true,
    remote_type    => 'tcp',
    log_local      => true,
    log_auth_local => true,
    custom_config  => undef,
    server         => 'mcomaster.local',
    port           => '514',
  }

}