pipeline {
    agent any
    stages {

        stage ("perform terraform initilisation")
        {
             steps{
                sh 'terraform init'
            }

        }

        stage ("apply terraform ")
        {
            steps {
                withCredentials([usernamePassword(credentialsId: 'my_aws_credentials', passwordVariable: 'my_aws_secret', usernameVariable: 'my_aws_key')]) 
                {
                sh  "AWS_ACCESS_KEY_ID=$my_aws_key AWS_SECRET_ACCESS_KEY=$my_aws_secret terraform apply -auto-approve"
                }
            }


        }
        
    }
    
}
