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
                    def remoteDirectory = '/opt/dproject1'  // Replace with your remote destination directory

                    def sshPublisherConfig = [
                        configName: 'dockerhost', // Use the SSH server configuration name you set up
                        transfers: [
                            [
                                sourceFiles: "${env.WORKSPACE}/**",
                                remoteDirectory: remoteDirectory,
                                removePrefix: env.WORKSPACE
                            ]
                        ]
                    ]

                    publishOverSSH(credentialsConfigurer: [
                        $class: 'ManuallyConfiguredCredentialsImpl',
                        credentialsId: sshPublisherConfig.configName
                    ], transfers: sshPublisherConfig.transfers)
                }
            }
        }
    }
}
