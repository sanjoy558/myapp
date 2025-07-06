pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                echo '📥 Pulling source code'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo '🐳 Building Docker Image'
                sh 'docker build -t myapp:latest .'
            }
        }

        stage('Run Container') {
            steps {
                echo '🚀 Running Docker Container'
                sh 'docker run -d -p 3001:3000 --name myapp_ci myapp:latest || true'
            }
        }
    }
}
