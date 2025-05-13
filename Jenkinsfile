pipeline {
    agent any
    environment{
        GIT_REPO='https://github.com/Shivprasadbendre/demo'
        BRANCH='main'
        CLONE_DIR="my_floder"
    }
    stages {
        stage('Clone Repository') {
            steps {
                dir("${CLONE_DIR}"){
                git branch:"${BRANCH}",url:"${GIT_REPO}"
                }
                    
                }
        }
        stage("Install dependencies"){
            steps{
                sh '''
                  sudo yum install python -y
                  sudo yum install pip -y
                  sudo yum install docker -y
                  sudo systemctl enable docker
                  sudo systemctl start docker
                  '''
            }
        }
        stage("stoping the running containers"){
            steps{
                script{
                    def running=
                    sh(script: "sudo docker ps -q -f name=flask",returnStdout:true).trim()
                    if (running){
                        sh "sudo docker stop flask"
                        sh "sudo docker rm flask"
                        sh "sudo docker image prune -f"
                    }
                }
            }
        }
        stage("run the app"){
            steps{
                dir("${CLONE_DIR}"){
                sh '''
                sudo docker build -t flask-app .
                sudo docker run -d --name=flask -p 3000:3000 flask-app
                '''
                }
            }
        }
    }
}
