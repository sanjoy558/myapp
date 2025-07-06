pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo '📥 Cloning from GitHub...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo '🐳 Building Docker image...'
                sh 'docker build -t myapp:latest .'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo '🚀 Running container on port 3001...'
                // Stop existing container if exists
                sh 'docker rm -f myapp_ci || true'
                // Run fresh container
                sh 'docker run -d -p 3001:3000 --name myapp_ci myapp:latest'
            }
        }
    }
}

