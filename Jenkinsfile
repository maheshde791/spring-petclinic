pipeline {
    agent { dockerfile true }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package -Dcheckstyle.skip=true'
            }
        }
        stage('Dockerize Application') {
            environment {
                HOME = "${env.WORKSPACE}"
            }
            steps {
                script {
                    def projectImage = docker.build("app:1", "--file dockerfile_app .")
                }
            }
        }
    }
}
