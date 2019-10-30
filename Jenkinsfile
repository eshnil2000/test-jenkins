pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                script {
                    def disk_size = sh(script: "df / --output=avail | tail -1", returnStdout: true).trim() as Integer
                    println("disk_size = ${disk_size}")
                    def UUID= sh(script: "date +%s",returnStdout: true)
                    println("UUID = ${UUID}")
                    def containerBuild = sh(script: "docker build -t dappsuni/blockchain .", returnStdout: true)
                    println("containerBuild = ${containerBuild}")
                    def containerID = sh(script: "docker run -d -p 5000 --network nginx-proxy --expose 5000 -e VIRTUAL_HOST=${UUID}.proxy.chainapp.live -e VIRTUAL_PORT=5000 dappsuni/blockchain", returnStdout: true)
                    println("containerID = ${containerID}")
                    println("your chain is running at ${UUID}.proxy.chainapp.live")
                }
            }
        }
    }
}
