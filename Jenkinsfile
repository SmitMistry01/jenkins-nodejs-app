pipeline{
    agent any
    environment{
        DOCKER_IMAGE = 'nodejs-app'
    }

    stages {
        stage('Checkout'){
            steps {
                checkout scm
            }
        }
        stage('Build'){
            steps {
                bat 'npm run build'
            }
        }
        stage('Docker Build') {
            steps {
                bat 'docker build -t %DOCKER_IMAGE% .'
            }
        }
        stage('Deploy'){
            steps{
                bat '''
                    docker stop %DOCKER_IMG% || true
                    docker rm %DOCKER_IMG% || true
                    docker run -d -p 3000:3000 %DOCKER_IMG% %DOCKER_IMG%
                '''
            }
        }
    }
    post {
        always {
            cleanWs()
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}