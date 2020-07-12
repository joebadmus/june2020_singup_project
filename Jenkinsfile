pipeline {
    agent any
    
    stages {
        stage('initial clean'){
            steps{
                sh 'rm -rf codebase || true'
            }
        }
        stage('SCM checkout'){
            steps{
                sh 'git clone https://github.com/joebadmus/june2020_singup_project.git codebase'
            }
        }

        stage('Deploy code'){
            steps {
                echo 'code Deployed successfully'
            }
        }
        
    }
}