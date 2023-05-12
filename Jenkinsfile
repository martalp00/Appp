pipeline {
    agent {
        docker {
            image 'appp_web'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    stages {
        stage('Compilar') {
            steps {
                sh 'docker-compose up --force-recreate --build -d web'

            }
        }
    }
}
