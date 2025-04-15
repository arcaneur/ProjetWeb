pipeline {
    agent any

    environment {
        IMAGE_NAME = 'mon-site-fetes'
        CONTAINER_NAME = 'test-site-fetes'
    }

    stages {
        stage('Cloner le dépôt') {
            steps {
                git url: 'https://github.com/arcaneur/ProjetWeb.git', branch: 'main'
            }
        }

        stage('Construire l\'image Docker') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Lancer le conteneur') {
            steps {
                sh '''
                    //docker rm -f $CONTAINER_NAME || true
                    docker run -d -p 8081:80 --name $CONTAINER_NAME $IMAGE_NAME
                '''
            }
        }
    }

    post {
        success {
            echo "✔️ Le site est lancé sur http://localhost:8080"
        }
        failure {
            echo "❌ Échec du pipeline"
        }
        cleanup {
            echo "🧹 Nettoyage..."
            sh 'docker rm -f $CONTAINER_NAME || true'
        }
    }
}
