pipeline {
    agent any // Default agent for the pipeline

    stages {
        stage('Build') {
            agent {
                dockerfile true // Runs on a Docker agent defined by a Dockerfile
            }
            steps {
                sh 'mvn clean package -Dcheckstyle.skip=true'
            }
        }
        stage('Dockerize Application') {
            steps {
                sh 'docker build -f dockerfile_app -t app:1 .'
            }
        }
    }
}
