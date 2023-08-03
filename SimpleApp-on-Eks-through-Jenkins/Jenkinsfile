pipeline {
    agent any
    parameters {
        string defaultValue: '007chiragshah', name: 'username'
        password defaultValue: 'Chir@g7424', name: 'password'
    }
    stages {
        stage("Hello-world-clone") {
            steps {
                script {
                    git branch: 'main', url: 'https://github.com/007chiragshah/Hello-World-EKS.git'
                }
            }
            post {
                success {
                    archiveArtifacts artifacts: '**/*', followSymlinks: false
                }
            }
        }
        stage("Hello-world-maven-test") {
            steps {
                script {
                    sh 'mvn test'
                }
            }
            post {
                success {
                    archiveArtifacts artifacts: '**/*', followSymlinks: false
                }
            }
        }
        stage("Hello-world-maven-build") {
            steps {
                script {
                    sh 'mvn install'
                }
            }
            post {
                success {
                    archiveArtifacts artifacts: '**/*', followSymlinks: false
                }
            }
        }
        stage("Hello-world-war-to-Docker") {
            steps {
                script {
                    sh 'docker build -t helloworld .'
                }
            }
            post {
                success {
                    archiveArtifacts artifacts: '**/*', followSymlinks: false
                }
            }
        }
        stage("Hello-world-image-to-dockerhub") {
            steps {
                script {
                    sh '''docker tag helloworld 007chiragshah/helloworld
                    docker login -u $username -p $password
                    docker push 007chiragshah/helloworld'''
                    }
                }
			post {
                success {
                    archiveArtifacts artifacts: '**/*', followSymlinks: false
                }
            }
        }
		stage("Hello-world-deploy-to-EKS") {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'AWS', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        sh '''aws eks update-kubeconfig --name EKS-Cluster --region ap-south-1
                        kubectl apply -f HelloWorld-Pod.yaml
                        kubectl apply -f HelloWorld-service.yaml'''
                    }
                }
                
            }
            
        }
    }
}
