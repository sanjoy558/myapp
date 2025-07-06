pipeline {
    agent any

    environment {
        APP_NAME = 'myapp'
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo '📥 Cloning repository...'
                git url: 'https://github.com/sanjoy558/myapp.git', branch: 'main'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo '📦 Installing npm dependencies...'
                sh 'npm install'
            }
        }

        stage('Build & Test') {
            steps {
                echo '🔧 Building and running tests...'
                // Add your actual test command if any
                sh 'node app.js & sleep 3 && curl -I http://localhost:3000 || echo "Check app port!"'
            }
        }

        stage('Docker Build (Optional)') {
            when {
                expression { fileExists('Dockerfile') }
            }
            steps {
                echo '🐳 Building Docker image...'
                sh """
                docker build -t ${APP_NAME}:latest .
                docker images | grep ${APP_NAME}
                """
            }
        }

        stage('Cleanup') {
            steps {
                echo '🧹 Cleaning up...'
                sh 'pkill node || true'
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline completed successfully.'
        }
        failure {
            echo '❌ Pipeline failed. Check logs.'
        }
    }
}
