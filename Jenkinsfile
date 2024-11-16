pipeline {
    agent {
        label 'inbound-agent'
    }
    environment {
        JAVA_HOME = '/opt/jdk-22'
        PATH = "${JAVA_HOME}/bin:${env.PATH}"
        DOCKER_TAG = "${env.BUILD_ID}" // Usar el numero de compilacion para la imagen
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/fidonoso/devops-certificate.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                // Construye la imagen Docker y la ejecuta localmente
                sh 'docker build -t myapp1:${DOCKER_TAG} .'
                sh 'docker run -d myapp1'
            }
        }
    }
    post {
        success {
            echo 'completado exitosamente'
        }
        failure {
            echo 'Algo salió mal'
        }
    }
}
