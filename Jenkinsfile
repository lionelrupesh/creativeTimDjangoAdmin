pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Build Docker image
                    docker.build("my-django-app")
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // You can add your testing commands here
                    docker.image('my-django-app').inside {
                        sh 'python timadmin/manage.py test'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Deploy using Docker Compose
                    dockerCompose(buildFile: 'docker-compose.yml', upOptions: '--build -d')
                }
            }
        }
    }

    post {
        always {
            // Cleanup steps if needed
            script {
                docker.image('my-django-app').remove()
                dockerCompose(buildFile: 'docker-compose.yml', downOptions: '--volumes --remove-orphans')
            }
        }
    }
}
