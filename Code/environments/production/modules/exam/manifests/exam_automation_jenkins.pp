class exam::exam_automation_jenkins {

   file {
	'jenkins_download':
	  ensure => 'file',
	  source => "puppet:///modules/exam/jenkins_download.sh",
	  path => '/usr/local/sbin/jenkins_download.sh',
	  owner => 'root',
	  group => 'root',
	  mode => '0744',
	  notify => Exec['run_jenkins_download'],
	}

   exec {
	'run_jenkins_download':
	command => '/usr/local/sbin/jenkins_download.sh',
	
	}
   
}
