pipeline {
    agent any

    stages {
        stage('CheckoutBasic') {
            steps {
                git branch: 'main', url: 'https://github.com/arifislam007/nginx-deploy-with-argocd.git'
            }
        }
        stage('Publish Artifact') {
            steps {
                script {
                    def remoteDir = "/opt/dproject1"
                    def remoteServer = [
                        // Replace these values with your remote server details
                        host: '10.200.205.187',
                        user: 'dockeradmin',
                        keyFile: credentials('dockerhost'),
                    ]
                    
                    // Copy the artifact to the remote server using SSH
                    sshPut remote: remoteServer,
                           from: "target/*",
                           into: remoteDir
                }
            }
        }
    }
}
