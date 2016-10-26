class exam::redis_automation {
   file {
      'my_automation_redis':
	ensure => 'file',
	source => "puppet:///modules/exam/redis_automation.sh",
	path => '/usr/local/sbin/redis_automation.sh',
	owner => 'root',
	group => 'root',
	mode => '0744',
	notify => Exec['run_automation_redis'],
	}
   exec {
	'run_automation_redis':
	command => '/usr/local/sbin/redis_automation.sh',
	}

}
