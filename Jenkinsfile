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
                  sudo su
                  yum install python -y
                  yum install pip -y
                  yum install docker -y
                  systemctl enable docker
                  systemctl start docker
                  '''
            }
        }
        stage("run the app"){
            steps{
                sh '''
                cd my_floder/
                docker build -t flask-app .
                docker run -d -p 3000:3000 flask-app
                '''
            }
        }
    }
}