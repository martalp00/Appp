pipeline {
    agent any

    stages {
        stage('Compilar') {
            steps {
                sh 'docker-compose up --build -d'
            }
        }

        stage('Isort') {
            steps {
                sh 'make isort'
            }
        }

        stage('Pylint') {
            steps {
                sh 'make pylint'
            }
        }
    }
}
