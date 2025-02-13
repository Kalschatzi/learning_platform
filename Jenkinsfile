pipeline {
    agent any
    triggers {
        pollSCM('*/5 * * * 1-5')
    }
    stages {
        stage('Example') {
            steps {
                echo 'Hello World'
            }
        }
    }
}