pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'nodejs-app'
        CONTAINER_NAME = 'nodejs-container'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                // First install dependencies
                bat 'npm install'
                
                // Then run build if you have a build script
                // If not, remove this line
                bat 'npm run build || echo "No build script found, continuing..."'
            }
        }
        
        stage('Docker Build') {
            steps {
                bat "docker build -t ${DOCKER_IMAGE} ."
            }
        }
        
        stage('Deploy') {
            steps {
                bat """
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true
                    docker run -d -p 3000:3000 --name ${CONTAINER_NAME} ${DOCKER_IMAGE}
                """
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
