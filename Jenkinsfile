pipeline {
         agent any
         stages {
		stage('Environment') {
			agent { 
				label 'master'
			}
			steps {
				echo "NODE_NAME = ${env.NODE_NAME}"
				sh 'printenv'
			}
		 }


                 stage('DeployedServer') {
                 parallel { 
				stage('Client A') {
				agent {
					//node 'ZSstage2'
					label 'ZScustomer'
				}
				steps {
					echo "NODE_NAME = ${env.NODE_NAME}"
					sh 'hostname -i'

					sh 'echo "Process Started"'
					sh 'pwd'
					
					// User provided value for dynamic URL of deployed app
					sh '/var/www/html/url.sh -a prd -b apac -c dx1234'
				}
				}
				stage('Client B') {
				agent {
					//node 'ZSstage2'
					label 'ZScustomer'
				}
				steps {
					echo "NODE_NAME = ${env.NODE_NAME}"
					sh 'hostname -i'

					sh 'echo "Process Started"'
					sh 'pwd'

					// User provided value for dynamic URL of deployed app
					sh '/var/www/html/url.sh -a prd -b amer -c dx4567'
				}
				}
				stage('Client C') {
				agent {
					//node 'ZSstage2'
					label 'ZScustomer'
				}
				steps {
					echo "NODE_NAME = ${env.NODE_NAME}"
					sh 'hostname -i'

					sh 'echo "Process Started"'
					sh 'pwd'
					
					// User provided value for dynamic URL of deployed app
					sh '/var/www/html/url.sh -a cmr -b emea -c dx1234'
				}
				}
				stage('Client D') {
				agent {
					//node 'ZSstage2'
					label 'ZScustomer'
				}
				steps {
					echo "NODE_NAME = ${env.NODE_NAME}"
					sh 'hostname -i'

					sh 'echo "Process Started"'
					sh 'pwd'
					
					// User provided value for dynamic URL of deployed app
					sh '/var/www/html/url.sh -a stg -b apac -c dx1444'
				}
				}
			}
		}
        }
}
