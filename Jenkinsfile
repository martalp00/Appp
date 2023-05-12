pipeline {
    agent {
        docker {
            dockerfile {
                filename 'Dockerfile'
            }
        }
    }

    stages {
        stage('Compilar') {
            steps {
                sh 'cd /home/marta/Escritorio/TFG/appp && docker-compose up --build -d'
            }
        }

        stage('Isort') {
            steps {
                sh 'cd /home/marta/Escritorio/TFG/appp && make isort'
            }
        }

        stage('Pylint') {
            steps {
                sh 'cd /home/marta/Escritorio/TFG/appp && make pylint'
            }
        }
    }
}

