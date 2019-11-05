pipeline {
    agent any
    stages {

         stage ("perform terraform initilisation ")
        {
            steps {
                withCredentials([usernamePassword(credentialsId: 'my_aws_credentials', passwordVariable: 'my_aws_secret', usernameVariable: 'my_aws_key')]) 
                {
                sh  "AWS_ACCESS_KEY_ID=$my_aws_key AWS_SECRET_ACCESS_KEY=$my_aws_secret terraform init"
                }
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

        stage ("pulldown liquor codebase")
        {
             steps{
                sh 'git clone https://github.com/demmya/LiquorStoreServlet.git codebase'
            }

        }

        stage ("Compile codebase")
        {
             steps{
                sh 'cd codebase && mvn clean install'
                echo 'COMPILED'
            }

        }


         stage ("Deploy code to Appserver")
        {
            steps {
                withCredentials([file(credentialsId: 'devops-2', variable: 'sec_file')]) 
                {
                   sh 'scp -i $sec_file codebase/target/SampleServerlet.war  ec2-user@63.35.179.51:/var/lib/tomcat/webapps/'
                    echo 'DEPLOYED' 
    
                }
            }


        }
 
    }
    
}
