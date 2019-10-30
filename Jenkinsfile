pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                script {
                    def disk_size = sh(script: "df / --output=avail | tail -1", returnStdout: true).trim() as Integer
                    println("disk_size = ${disk_size}")
                    def UUID= sh(script: "cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1",returnStdout: true)
                    println("UUID = ${UUID}")

                }
            }
        }
    }
}
