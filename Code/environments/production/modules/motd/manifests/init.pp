class motd {
	   file { '/etc/motd':
	        owner => 'root',
	        group => 'root',
	        mode => '0644',
	        content => inline_template("The current time is <%=Time.now %>\n")
	      }
	   }	
