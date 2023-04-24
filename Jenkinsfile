pipeline {
    agent {
        docker {
            image 'python:3.9'
            args '-u root'
        }
    }
    environment {
        PIPENV_VENV_IN_PROJECT = true
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh 'pip install pipenv'
                sh 'pipenv install --dev'
                sh 'make build'
            }
        }
        stage('Lint') {
            steps {
                sh 'make pylint'
                sh 'make isort'
                sh 'make lint'
            }
        }
    }
}
