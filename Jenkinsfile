pipeline {
    agent {
    
        node {
            environment {
                DISABLE_AUTH = 'true'
                DB_ENGINE    = 'sqlite'
            }
        }
    }
    stages {

        stage('envars') {
            steps {
                echo "Database engine is ${DB_ENGINE}"
                sh 'printenv'
            }
        }
        
        stage('Deploy') { 
            agent {
                docker {
                    image 'python:3.6-alpine' 
                    args '-p 5000 --network nginx-proxy --expose 5000 -e VIRTUAL_HOST="${env.rnd}".proxy.chainapp.live -e VIRTUAL_PORT=5000  '
                }
            }
            steps {
                sh 'pip install -r requirements.txt'
                sh 'chmod +x ./scripts/deliver.sh'
                sh './scripts/deliver.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh 'chmod +x ./scripts/kill.sh'
                sh './scripts/kill.sh'
            }
        }        
    }
}
