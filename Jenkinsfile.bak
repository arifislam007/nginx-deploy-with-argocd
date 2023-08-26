pipeline {
    agent any

    stages {
        stage('CheckoutBasic') {
            steps {
                git branch: 'main', url: 'https://github.com/arifislam007/nginx-deploy-with-argocd.git'
            }
        }
		stage('SSH transfer') {
			steps {
				script {
					sshPublisher(
						continueOnError: false,
						failOnError: true,
						publishers: [
							sshPublisherDesc(
								configName: 'dockerhost', // Use the credential ID you created
								verbose: true,
								transfers: [
									sshTransfer(
										sourceFiles: "/var/lib/jenkins/workspace/cicd-project-2/",
										removePrefix: "/var/lib/jenkins/workspace/cicd-project-2/",
										remoteDirectory: "/opt/dporject1",
										execCommand: "cd /opt/dproject1",
										execCommand: "pwd",
									)
								]
							)
						]
					)
				}
			}
		}
    }
}