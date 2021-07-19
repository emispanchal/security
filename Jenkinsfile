pipeline {
    agent any
   
    options { 
        quietPeriod(10) 
    }
    
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
        stage('Compile') {
            steps {
                sh 'mvn compile'
            }
        }
       stage('Build Docker Image') {
             steps {
                 
                 sh 'docker build -t emispanchal/my_app:1.0.0 .'
             }
        }
         stage('Push Docker Image'){
             steps {
                 withCredentials([string(credentialsId: 'docker_pwd', variable: 'DockerHubPwd')]) {
                 sh 'docker login -u emispanchal -p ${DockerHubPwd}'
        }
                 sh 'docker push emispanchal/my_app:1.0.0'
             }
         }


}

