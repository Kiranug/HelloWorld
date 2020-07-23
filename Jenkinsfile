#!/usr/bin/env groovy

@Library('jenkins-shared-library-framework@master') _ //master or whatever branch

pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                HelloWorld ('testing')
            }
        }
    }
}
