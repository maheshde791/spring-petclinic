pipeline {
    agent { dockerfile true }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package -Dcheckstyle.skip=true'
            }
        }
        stage('Dockerize Application') {
            steps {
                def projectImage = docker.build("app:1", "--f dockerfile_app .")
            }
        }
    }
}
