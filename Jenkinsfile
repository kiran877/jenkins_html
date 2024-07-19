pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/kiran877/jenkins_html.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('my-html-project')
                }
            }
        }

        stage('Stop Previous Container') {
            steps {
                script {
                    // Try to stop any running container with the same name
                    sh 'docker stop my-html-project || true'
                    sh 'docker rm my-html-project || true'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.image('my-html-project').run('-p 8081:80')
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
