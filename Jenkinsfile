pipeline {
    agent {
        docker {
            image 'maven:latest' // Use a Maven image as the base image for the build environment
            args '-v /var/run/docker.sock:/var/run/docker.sock' // Mount Docker socket into the container
        }
    }
    environment {
        DOCKER_BUILDKIT = '1' // Enable Docker BuildKit
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package -Dcheckstyle.skip=true'
            }
        }
        stage('Dockerize Application') {
            steps {
                script {
                    // Use Docker Buildx to build the Docker image
                    def projectImage = docker.build('app:1', '--file dockerfile_app .')
                }
            }
        }
    }
}
