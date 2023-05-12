pipeline {
    agent any
  
    stages {
        stage('Build') {
            steps {
                script {
                    docker.build('appp_image', '-f Dockerfile .')
                }
            }
        }

        stage('Run') {
            steps {
                script {
                    docker.withRegistry('') {
                    docker.image('appp_image').run('-p 8000:8000 -d')
                    }
                }
            }
        }
    }
    }
