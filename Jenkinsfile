pipeline {
  agent any

  options {
    timeout(time: 2, unit: 'MINUTES')
  }

  environment {
    ARTIFACT_ID = "elbuo8/webapp:${env.BUILD_NUMBER}"
    DOCKER_REGISTRY = "127.0.0.1:5000" // Your Docker registry address
    DOCKER_CREDENTIALS_ID = "docker-credentials" // Jenkins credentials
  }
   stages {
   stage('Building image') {
      steps{
          sh '''
          docker build -t testapp .
             '''  
        }
    }
  
  
    stage('Run tests') {
      steps {
        sh "docker run testapp npm test"
      }
    }
   stage('Deploy Image') {
      steps{
        sh '''
        echo "adminuser:12081994" | docker login 127.0.0.1:5000 --username adminuser --password-stdin
        docker tag testapp 127.0.0.1:5000/mguazzardo/testapp
        docker push 127.0.0.1:5000/mguazzardo/testapp   
        '''
        }
      }
    }
}


    
  

