pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "my-html-project"
        DOCKER_IMAGE_VERSION = "latest"
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
                    // Try to stop any running container with the same name
                    sh "docker stop ${DOCKER_IMAGE} || true"
                    sh "docker rm ${DOCKER_IMAGE} || true"
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.image("${DOCKER_IMAGE}:${DOCKER_IMAGE_VERSION}").run("-p 8080:80 --name ${DOCKER_IMAGE}")
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded! The HTML page is available at http://<jenkins-server-ip>:8080'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
