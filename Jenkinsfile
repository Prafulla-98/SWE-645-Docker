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
                    DATE_TAG = java.time.LocalDate.now()
                    DATETIME_TAG = java.time.LocalDateTime.now()
                    sh "echo ${DATETIME_TAG}"
                    sh "sudo docker login -u prafulladevi -p ${DOCKERHUB_PASS}"
                    def customImage = docker.build("prafulladevi/swe645-project2:${DATETIME_TAG}")
                }
            }
        }
        stage("Pushing Image to DockerHub") {
            steps {
                script {
                    sh 'docker push prafulladevi/swe645-project2:${DATETIME_TAG}'
                }
            }
        }
        stage("Deploying to Rancher as a single pod") {
            steps {
                sh 'kubectl set image deployment/swe-hw2-pipeline swe-hw2-pipeline=prafulladevi/swe645-project2:${DATETIME_TAG} -n jenkins-pipeline'
            }
        }
        stage("Deploying to Rancher as with load balancer") {
            steps {
                sh 'kubectl set image deployment/swe-hw2-lb swe-hw2-lb=prafulladevi/swe645-project2:${DATETIME_TAG} -n jenkins-pipeline'
            }
        }
    }
}
