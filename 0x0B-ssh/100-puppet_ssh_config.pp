#!/usr/bin/env bash
# Using puppet to connect without needing a password

file { '/etc/ssh/ssh_config';
  ensure => present,
}

file_line { 'Turn off passwd auth':
  path    => '/etc/ssh/ssh_config',
  line    => 'passwordAuthentication no',
  match   => '^#PasswordAuthentication',
}

file_line { 'Declare identity file':
  path    => '/etc/ssh/ssh_config',
  line    => 'identityFile ~/.ssh/school',
  match   => '^#IdentityFile',
}
