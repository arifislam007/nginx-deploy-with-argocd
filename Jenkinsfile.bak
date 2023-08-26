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
                    def remoteDirectory = '/opt/dproject2'  // Replace with your remote destination directory
                    
                    sshPublisher(
                        continueOnError: false,
                        failOnError: true,
                        publishers: [
                            sshPublisherDesc(
                                configName: 'dockerhost', // Use the credential ID you created
                                verbose: true,
                                transfers: [
                                    sshTransfer(
                                        execCommand: "mkdir -p ${remoteDirectory}",
                                    ),
                                    sshTransfer(
                                        execCommand: "rsync -avz ${env.WORKSPACE}/ ${remoteDirectory}",
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
