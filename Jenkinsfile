pipeline {
    agent any

    stages {
        stage('Compilar') {
            steps {
                sh 'docker-compose up --build -d'
            }
        }
    }
}

