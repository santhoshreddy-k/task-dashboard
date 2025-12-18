pipeline {
    agent any

    tools {
        maven 'Maven-3'   // must match the name in Tools
    }
    
    stages {

        stage('Build') {
            steps {
               sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                sh '''
                  echo "Running tests"
                  date
                '''
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
