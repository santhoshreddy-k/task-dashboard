pipeline {
    agent any
    
    stages {

        stage('Build with docker') {
            steps {
               sh 'docker build -t task-dashboard:latest .'
            }
        }


        stage('Deploy') {
            steps {
                sh '''
                  echo "Deploying application"
                '''
            }
        }
    }
}
