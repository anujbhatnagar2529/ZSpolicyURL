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

				stage('Build Server') {
				agent {
					//node 'ZSstage2'
					label 'ZSbuild'
				}
				steps {
					echo "NODE_NAME = ${env.NODE_NAME}"
					sh 'hostname -i'
					sh 'namingPolicy.sh"'
					sh 'echo "Build Started"'
					sh 'pwd'
    					sh './namingPolicy.sh -a prd -b apac -c d1234'							
				}
				}
							
                 stage('DeployedServer') {
                 parallel { 
							stage('Production Server1') {
							agent {
								//node 'ZSstage2'
								label 'ZSProd'
							}
							steps {
								echo "NODE_NAME = ${env.NODE_NAME}"
								sh 'hostname -i'
								sh 'echo "Build Started"'
								sh 'pwd'
								sh 'pwd'
								sh './namingPolicy.sh -a cmd -b amer -c c1234'							
								
							}
							}
			 
							steps {
								echo "NODE_NAME = ${env.NODE_NAME}"
								sh 'hostname -i'
								sh 'namingPolicy.sh"'
								sh 'echo "Build Started"'
								sh 'pwd'
								sh './namingPolicy.sh -a prd -b apac -c d1234'							
							}
							}

					}
				}
        }
}
