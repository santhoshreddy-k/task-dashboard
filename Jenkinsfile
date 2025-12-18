pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh '''
                  echo "Building application"
                  ls -l
                '''
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
