pipeline {
    agent any

    environment {

        SERVICENOW_INSTANCE = 'https://birlasoftindemo2.service-now.com'
        SERVICENOW_CREDENTIALS = 'servicenow-creds'
    }

    stages {
        stage('Git Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/ankitagrawal26/CICD_automation_Demo2.git'
            }
        }
        stage('Docker Image') {
            steps {
                script {
                    sh '''docker build -t demo-automation .'''
                 }
            }
        }
        stage('Deployment') {
            steps {
                script {
                    // sh ''' docker stop bslco'''
                    // sh ''' docker rm bslco'''
                    sh ''' docker run -d -p 90:80 --name bslco demo-automation'''
                 }
            }
        }
        stage('Create ServiceNow Ticket') {
            steps {
                script {
                    def response = httpRequest(
                        url: "${env.SERVICENOW_INSTANCE}/api/now/table/incident",
                        httpMode: 'POST',
                        authentication: "${env.SERVICENOW_CREDENTIALS}",
                        contentType: 'APPLICATION_JSON',
                        requestBody: '''{
                            "short_description": "New code commit detected",

                            "description": "A new code commit has been made to the repository. Please review.",
                            "category": "Software",
                            "subcategory": "Application"
                        }'''
                    )
                    echo "ServiceNow response: ${response.content}"
                }
            }
        }
    }
}

