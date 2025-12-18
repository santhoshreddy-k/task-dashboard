pipeline {
    agent any

    tools {
        maven 'maven-3'   // must match the name in Tools
    }
    
    stages {

        stage('Build with docker') {
            steps {
               sh 'build -t task-dashboard:latest .'
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
