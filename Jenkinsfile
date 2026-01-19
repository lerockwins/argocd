pipeline {
    agent any

    environment {
        DOCKER_USER = "haji4747"
        IMAGE_NAME  = "myapp"
        IMAGE_TAG   = "${BUILD_NUMBER}"
        FULL_IMAGE  = "${DOCKER_USER}/${IMAGE_NAME}:${IMAGE_TAG}"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/lerockwins/argocd.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker Image: ${FULL_IMAGE}"
                sh "docker build -t ${FULL_IMAGE} ."
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USERNAME',
                    passwordVariable: 'DOCKER_PASSWORD'
                )]) {
                    sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                echo "Pushing Image to Registry"
                sh "docker push ${FULL_IMAGE}"
            }
        }
    }

    post {
        success {
            echo "Docker Image Built & Pushed Successfully: ${FULL_IMAGE}"
        }
        failure {
            echo "Docker Build or Push Failed"
        }
    }
}
