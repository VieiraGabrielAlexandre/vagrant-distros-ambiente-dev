exec { 'apt-update':                    
  command => '/usr/bin/apt-get update && /usr/bin/apt-get install net-tools'  
}

package { ['php8.0', 'php8.0-mysql']:
  require => Exec['apt-update'],        
  ensure => installed,
}

exec { 'run-php8':       
  require =>  Package['php8.0'],            
  command => '/usr/bin/php -S 0.0.0.0:8888 -t /vagrant/src &'
}
