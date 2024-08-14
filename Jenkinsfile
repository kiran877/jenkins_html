pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "my-html-project"
        DOCKER_IMAGE_VERSION = "latest"
        DOCKERHUB_CREDENTIALS = 'docker-cred' 
        DOCKERHUB_REPO = "saikiran078/jenkins_html" 
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/kiran877/jenkins_html.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:${DOCKER_IMAGE_VERSION}")
                }
            }
        }

        stage('Stop Previous Container') {
            steps {
                script {
                    sh "docker stop ${DOCKER_IMAGE} || true"
                    sh "docker rm ${DOCKER_IMAGE} || true"
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.image("${DOCKER_IMAGE}:${DOCKER_IMAGE_VERSION}").run("-p 8081:80 --name ${DOCKER_IMAGE}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKERHUB_CREDENTIALS}") {
                        docker.image("${DOCKER_IMAGE}:${DOCKER_IMAGE_VERSION}").push()
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded! The HTML page is available at http://<jenkins-server-ip>:8081'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
