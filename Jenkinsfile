pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                mvn clean package
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
