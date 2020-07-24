pipeline {
    agent any
    
    stages {
        stage("checking deploy tools and initial clean"){
            steps{
                sh 'sudo docker container rm -f my_app || true'
                sh 'sudo docker image rm -f flask-app || true'
                sh 'rm -rf codebase || true'
            }
        }
        
        stage("pull down code base"){
            steps{
                sh 'git clone https://github.com/joebadmus/june2020_singup_project.git codebase'
            echo "====++++Code pulled++++===="
            }
        }

        stage("Builder docker Image"){
            steps {
                sh 'cd codebase/ && sudo docker build -t flask-app:latest .'
                sh 'sudo systemctl daemon-reload && sudo systemctl restart docker'
                echo "====++++Image Created++++===="
            }
        }

        stage("Run App in App Server"){

            steps {
                withCredentials([string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'KEY'), string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'SECRET')]) {
                    sh 'sudo docker run -d -e AWS_ACCESS_KEY_ID=$ID -e AWS_SECRET_ACCESS_KEY=$KEY -p 5000:5000 --name my_app flask-app:latest'
                }
                echo 'code Deployed'
                }
        }
                
        stage("complete"){
            steps {
                echo 'complete'
            }
        }
    }
}