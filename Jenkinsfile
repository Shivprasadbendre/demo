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
        stage("run the app"){
            steps{
                sh '''
                cd my_floder/
                sudo docker build -t flask-app .
                sudo docker run -d -p 3000:3000 flask-app
                '''
            }
        }
    }
}
