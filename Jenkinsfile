pipeline {
    agent any
    triggers {
        pollSCM('*/5 * * * 1-5')
    }
    stages {
      stage('Install Java') {
        steps {
          script {
              sh '''
                  make init
                  make docker-run
              '''
            }
        }
      }
    }
    post {
    // Clean after build
    always {
      cleanWs(cleanWhenNotBuilt: false,
        deleteDirs: true,
        disableDeferredWipeout: true,
        notFailBuild: true,
        patterns: [[pattern: '.gitignore', type: 'INCLUDE'],
          [pattern: '.propsfile', type: 'EXCLUDE']])
    }
  }
}