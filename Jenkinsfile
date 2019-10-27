pipeline {
    agent any
    stages{
        stage ("perform terraform initilisation")
        steps{
                sh 'terraform init'
        }
    }

    stages{
        stage ("apply terraform ")
        steps{
                sh 'terraform apply --auto-approve'
        }
    }
    
}
