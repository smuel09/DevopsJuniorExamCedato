class exam { 


notify { "I am installing apache, jenkins and redis": }
include exam::exam_automation
include exam::redis_automation
include exam::firewall

}
