pipeline {
    agent any
    environment {
        SONAR_TOKEN= 'e5ad80ddd4802f3096d3e3d58909f196e81f69ae'
        APP_HOME='/home/app'
        PRAGRA_BATCH='devs'
    }
    options { 
        quietPeriod(30) 
    }
    parameters { 
            choice(name: 'ENV_TO_DEPLOY', 
            choices: ['ST', 'UAT', 'STAGING'], description: 'Select a Env to deploy') 

             booleanParam(name: 'RUN', defaultValue: true, description: 'SELECT TO RUN')
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

}
