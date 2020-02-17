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
					sh 'NewUrl=$(/var/www/html/url.sh -a prd -b apac -c dx1234 | head -4| tail -1)'
					sh '/var/www/html/accessURL.sh ${NewUrl}.html'
					
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
					sh 'NewUrl=$(/var/www/html/url.sh -a prd -b amer -c dx4567 | head -4| tail -1)'
					sh '/var/www/html/accessURL.sh ${NewUrl}.html'
					
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
					sh 'NewUrl=$(/var/www/html/url.sh -a cmr -b emea -c dx1234 | head -4| tail -1)'
					sh '/var/www/html/accessURL.sh ${NewUrl}.html'

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
					sh 'NewUrl=$(/var/www/html/url.sh -a stg -b apac -b dx1444 | head -4| tail -1)'
					sh '/var/www/html/accessURL.sh ${NewUrl}.html'
				}
				}
			}
		}
        }
}
