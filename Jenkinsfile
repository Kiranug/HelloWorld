#!/usr/bin/env groovy

@Library('jenkins-shared-library-framework@master') _ //master or whatever branch

pipeline{

      agent {
                docker {
                image 'maven'
                args '-v $HOME/.m2:/root/.m2'
                }
            }
        
        stages{

              stage('maven build'){
                  steps{
                      script{
		    	                sh "mvn clean install"
                      	  }
               	     }  
                 }	
                 
                 stage ('Check logs') {
                    steps {
                        filterLogs ('WARNING', 1)
                    }
                }
		
           }	       	     	         
}
