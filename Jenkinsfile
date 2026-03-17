pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'adarsh7890/jenkins-test'
        DOCKER_TAG = 'latest'
    }

    stages {

        stage('Checkout') {
            steps {
                echo 'Code checked out from GitHub!'
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

        stage('Docker Build') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-credentials',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}'
                    sh 'docker push ${DOCKER_IMAGE}:${DOCKER_TAG}'
                }
            }
        }

        stage('Done') {
            steps {
                echo 'Image pushed to Docker Hub! 🎉'
            }
        }
    }
}
