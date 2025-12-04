pipeline {
    agent {
        kubernetes {
            defaultContainer 'maven'
            yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    jenkins: multi-container-example
spec:
  containers:
  - name: maven
    image: maven:3.9.6-eclipse-temurin-17
    command:
    - cat
    tty: true

  - name: node
    image: node:20-alpine
    command:
    - cat
    tty: true

  - name: kubectl
    image: bitnami/kubectl:latest
    command:
    - cat
    tty: true
"""
        }
    }

    stages {

        stage('Check Maven Container') {
            steps {
                container('maven') {
                    sh 'echo "Running inside Maven container:"'
                    sh 'mvn -version'
                }
            }
        }

        stage('Check Node.js Container') {
            steps {
                container('node') {
                    sh 'echo "Running inside Node container:"'
                    sh 'node -v'
                    sh 'npm -v'
                }
            }
        }

        stage('Check Kubectl Container') {
            environment {
                KUBECONFIG = "/var/run/secrets/kubernetes.io/serviceaccount/token"
            }
            steps {
                container('kubectl') {
                    sh 'echo "Running inside Kubectl container:"'
                    sh 'kubectl version --client'
                }
            }
        }

    }
}
