pipeline {
    agent { dockerfile true }
    stages {
        stage('Build') {
            steps {
                //sh 'mvn clean package -Dcheckstyle.skip=true'
                sh 'mkdir target'
                sh 'touch target/spring-petclinic-1.0-SNAPSHOT.jar'
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
