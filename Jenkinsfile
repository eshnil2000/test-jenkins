pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'chmod +x ./scripts/launch.sh'
                sh './scripts/launch.sh'
            }
        }
    }
}
