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