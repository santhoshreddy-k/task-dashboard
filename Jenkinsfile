pipeline {
    agent any

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
