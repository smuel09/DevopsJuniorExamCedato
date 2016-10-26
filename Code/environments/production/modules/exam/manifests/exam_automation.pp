class exam::exam_automation {
   file {
	'automate_apache':
	  ensure => 'file',
	  source => "puppet:///modules/exam/automate_apache.sh",
	  path => '/usr/local/sbin/automate_apache.sh',
	  owner => 'root',
	  group => 'root',
	  mode => '0744',
	  notify => Exec['run_automate_apache'],
	}

   exec {
	'run_automate_apache':
	command => '/usr/local/sbin/automate_apache.sh',
	
	}


}
