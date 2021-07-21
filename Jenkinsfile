pipeline{
    agent any
    options { 
        quietPeriod(30) 
     }
   
    triggers {
        pollSCM('* * * * *')
    }
    tools{
        maven  'm3'
        jdk 'jdk11'
    }

    stages {
        stage('Clean Ws') {
            steps{
                cleanWs()
            }
        }
        stage('Git CheckoutOut'){
            steps{
                checkout scm
            }
        }
       stage ('Maven Package'){
            steps{
                sh 'mvn package'
            }
        }
       stage('Build Docker Image') {
             steps {
                 sh 'docker login -u emispanchal -p "Panchal@09"' 
                 sh 'docker build -t emispanchal/my_app:1.0.0 .'
                 
             }
        }
        
         stage('Push Docker Image'){
             steps {
                
                 sh 'docker push emispanchal/my_app:1.0.0'
             }
         }
        
        stage('Run Container On Dev Server'){
            def dockerRun= 'docker run -p 8080:8080 -d -name my_app/my_app:1.0.0' 
             steps {
                sshagent(['dev_server']) {
                    sh "ssh -o StrictHostKeyChecking=no emispanchal@172.31.4.1 ${dockerRUN}"
                
              }
            }
         }
       }
    }
