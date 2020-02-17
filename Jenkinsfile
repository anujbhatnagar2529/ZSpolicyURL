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
					sh 'echo "Build Started"'
					sh 'pwd'
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
							}
							}
							stage('Production Server2') {
							agent {
								//node 'ZSstage2'
								label 'ZSProd'
							}
							steps {
								echo "NODE_NAME = ${env.NODE_NAME}"
								sh 'hostname -i'
								sh 'echo "Build Started"'
								sh 'pwd'
							}
							}
							stage('Production Server3') {
							agent {
								//node 'ZSstage2'
								label 'ZSProd'
							}
							steps {
								echo "NODE_NAME = ${env.NODE_NAME}"
								sh 'hostname -i'
								sh 'echo "Build Started"'
								sh 'pwd'
							}
							}
					}
				}
        }
}
