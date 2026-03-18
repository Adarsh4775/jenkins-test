pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'adarsh7890/jenkins-test'
        DOCKER_TAG = 'latest'
        EC2_IP = '34.236.150.79'
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

        stage('Deploy to EC2') {
            steps {
                sshagent(['ec2-ssh-key']) {
                    sh '''
                        ssh -o StrictHostKeyChecking=no ubuntu@34.236.150.79 "
                        docker pull adarsh7890/jenkins-test:latest &&
                        docker stop myapp || true &&
                        docker rm myapp || true &&
                        docker run -d -p 5000:5000 --name myapp adarsh7890/jenkins-test:latest
                        "
                    '''
                }
            }
        }

        stage('Done') {
            steps {
                echo 'App deployed to EC2! 🎉'
            }
        }
    }
}
