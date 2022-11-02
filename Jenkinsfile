def gv

pipeline {
    agent any
    stages {
        stage("init"){
            steps{
                script{
                    gv = load "script.groovy"
                }
            }
        }
        stage('build image') {
            steps {
                script{
                    gv.buildImage()
                }
            }
        }
        stage('deploy') {
            steps{
                script {
                    echo "Deployoing docker image to EC2..."
                    def dockerCmd = "docker run -p 39797:39797 -d energi:v3.1.2"
                    sshagent(['ec2-server-key']){
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@<ip_addr> ${dockerCmd}"
                    }
                }
            }
        }
    }
}