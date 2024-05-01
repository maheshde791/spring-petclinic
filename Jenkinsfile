pipeline {
    agent { dockerfile true }
    stages {
        stage('Build') {
            steps {
                sh 'node --version'
                sh 'svn --version'
                sh 'mvn clean build'
            }
        }
    }
}
