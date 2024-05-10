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
                sh 'mvn clean package -Dcheckstyle.skip=true -Dmaven.test.skip=true' 
                //sh 'mkdir target'
                //sh 'touch target/spring-petclinic-1.0-SNAPSHOT.jar'
            }
        }
        stage('Dockerize Application') {
            environment {
                HOME = "${env.WORKSPACE}"
            }
            steps {
                script {
                    def projectImage = docker.build("maheshde791/app:1", "--file dockerfile_app .")
                }
            }
        }
        stage('Push Image') {
            environment {
                    DOCKERHUB_CREDENTIALS = credentials('maheshde791_dockerhub_cred')
                    HOME = "${env.WORKSPACE}"
            }
            steps {
                    sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                    sh 'docker push maheshde791/app:1'
            }
        }
    }
    post {
        always {
          sh 'docker logout'
        }
    }
}
