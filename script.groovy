//We consisder that we aleady stored docker hub credentials 
//on jenkins agent credentials pluggin (global scope).
def buildImage(){
    echo "Building the docker image..."
    withCredentials([usernamePassword(credentialsId: 'docker-hub-login-param', ,passwordVariable:'PASS', usernameVariable: 'USER')]){
        sh "echo $PASS | docker login -u $USER --password-stdin"
        sh "export DOCKER_CONTENT_TRUST=1; docker build -t energi:v3.1.2 ."
    }

}