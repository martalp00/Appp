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
                sh 'docker-compose up --build -d'
            }
        }
    }
}

