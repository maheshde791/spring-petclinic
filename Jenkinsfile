pipeline {
    agent { dockerfile true }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package -Dcheckstyle.skip=true'
            }
        }
        stage('Dockerize Application') {
            agent {
               label "built-in"
            }
            steps {
                sh 'docker build -f dockerfile_app -t app:1 .'
            }
        }
    }
}
