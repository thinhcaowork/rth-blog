pipeline {
    agent { docker { image 'ruby' } }
    stages {
        stage('build') {
            steps {
                sh 'ruby --version'
                echo 'Hello world! RTH - Tavin' 
            }
        }
    }
}
