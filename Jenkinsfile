pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "shal905/shalini-flask-app"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/shalinis9/flask-ci-cd-pipline.git'

            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        dockerImage.push("latest")
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    sh '''
                        docker stop shalini-container || true
                        docker rm shalini-container || true
                        docker pull shal905/shalini-flask-app:latest
                        docker run -d -p 5000:5000 --name shalini-container shal905/shalini-flask-app:latest
                    '''
                }
            }
        }
    }
}
