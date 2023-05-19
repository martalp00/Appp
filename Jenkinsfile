pipeline {
    agent any

    stages {
        stage('Preparacion') {
            steps {
                // Detener y liberar el puerto 9090 y 8000 si está en uso
                sh '/var/lib/jenkins/.local/bin/pipenv run make clean-ports'
            }
        }

        stage('Instalar dependencias') {
            steps {
                sh 'pip install pipenv'
                sh '/var/lib/jenkins/.local/bin/pipenv install'
            }
        }

        stage('Compilar APPP') {
            steps {
                sh '/var/lib/jenkins/.local/bin/pipenv run make start-pipeline' 
            }
        }
        
        stage('Stop APPP') {
            steps {
                sh '/var/lib/jenkins/.local/bin/pipenv run make stop-pipeline'
            }
        }

        stage('Isort') {
            steps {
                sh '/var/lib/jenkins/.local/bin/pipenv run make isort'
            }
        }

        stage('Pylint') {
            steps {
                sh '/var/lib/jenkins/.local/bin/pipenv run make pylint'
            }
        }
    }
}
