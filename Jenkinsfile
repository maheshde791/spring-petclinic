pipeline {
        agent {
        dockerfile {
            filename 'Dockerfile'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
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
