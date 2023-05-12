pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t appp_image:latest .'
                sh 'docker run -d --name appp_container -p 8000:8000 appp_image'
            }
        }

        stage('Stop') {
            steps {
                sh 'docker stop appp_container'
                sh 'docker rm appp_container'
            }
        }
    }
}
