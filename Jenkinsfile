pipeline {
    agent any
    environment {
        DOCKERHUB_PASS = credentials('docker-pass')
    }
    stages {
        stage("Building the Student Survey Image") {
            steps {
                script {
                    checkout scm
                    sh 'rm -rf *.war'
                    sh 'jar -cvf SWE-645-HW1.war -C WebContent/ .'
                    sh 'echo ${BUILD_TIMESTAMP}'
                    sh "docker login -u prafulladevi -p ${DOCKERHUB_PASS}"
                    def customImage = docker.build("prafulladevi/swe645-project2:${BUILD_TIMESTAMP}")
                }
            }
        }
        stage("Pushing Image to DockerHub") {
            steps {
                script {
                    sh 'docker push prafulladevi/swe645-project2:${BUILD_TIMESTAMP}'
                }
            }
        }
        stage("Deploying to Rancher as a single pod") {
            steps {
                sh 'kubectl set image deployment/swe-hw2-pipeline swe-hw2-pipeline=prafulladevi/swe645-project2:${BUILD_TIMESTAMP} -n jenkins-pipeline'
            }
        }
        stage("Deploying to Rancher as with load balancer") {
            steps {
                sh 'kubectl set image deployment/swe-hw2-lb swe-hw2-lb=prafulladevi/swe645-project2:${BUILD_TIMESTAMP} -n jenkins-pipeline'
            }
        }
    }
}