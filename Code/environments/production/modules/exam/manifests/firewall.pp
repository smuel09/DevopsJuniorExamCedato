class exam::firewall {
   file {
      'my_firewall':
	ensure => 'file',
	source => "puppet:///modules/exam/firewall.sh",
	path => '/usr/local/sbin/firewall.sh',
	owner => 'root',
	group => 'root',
	mode => '0744',
	notify => Exec['run_firewall'],
	}
   exec {
	'run_firewall':
	command => '/usr/local/sbin/firewall.sh',
	}

}
