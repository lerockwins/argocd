pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo "Code already checked out by Jenkins"
            }
        }

        stage('Build') {
            steps {
                echo "Build step here"
                // Example for Java:
                // sh 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                echo "Test step here"
                // sh 'mvn test'
            }
        }
    }

    post {
        success {
            echo 'CI Pipeline Completed Successfully'
        }
        failure {
            echo 'CI Pipeline Failed'
        }
    }
}
