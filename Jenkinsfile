pipeline {
    agent any
    stages {
        stage('Cloning Git') {
            steps {
                git credentialsId: 'git', url: 'https://github.com/tx-talocity/red-velvet'    
            }
        }
    
    
        stage('Building image') {
            steps {
               script {
                  sh 'docker build -t pythonimg:latest .'
                }
             }
        }
    
        stage('Pushing to ECR') {
            steps{  
                script {
                  withCredentials([[
                  $class: 'AmazonWebServicesCredentialsBinding',
                  credentialsId: 'cred',
                  accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                  secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']])     
                  {
                    sh 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 028172179913.dkr.ecr.ap-south-1.amazonaws.com'
                    sh 'docker tag pythonimg:latest 028172179913.dkr.ecr.ap-south-1.amazonaws.com/pythonimg:latest'
                    sh  'docker push 028172179913.dkr.ecr.ap-south-1.amazonaws.com/pythonimg:latest'
                  }        
                }
            }  
        }    
        stage ('Building run') {
            steps {
               script {
                  sh 'docker run -itd --name c5 -p 8006:8000 pythonimg:latest sh'
                }
             }
        }
                
    }
}    
