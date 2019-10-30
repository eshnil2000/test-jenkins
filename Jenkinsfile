pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'export NEW_UUID=$(cat /dev/urandom | tr -dc "a-zA-Z0-9" | fold -w 32 | head -n 1)'
                sh 'echo $NEW_UUID'
            }
        }
    }
}
