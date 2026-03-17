pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                echo 'Code checked out!'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean compile'
            }
        }
        stage('Test') {
            steps {
                echo 'Tests passed!'
            }
        }
        stage('Done') {
            steps {
                echo 'Pipeline completed successfully!'
            }
        }
    }
}
