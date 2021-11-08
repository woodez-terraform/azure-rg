pipeline {

  agent { label 'azure' }

  parameters{
      string(defaultValue: 'Project name', name: 'Project', description: 'When doing a show or teardown action all you need to define is project', trim: true)
      choice(choices: ['Build', 'Teardown', 'Show'], description: 'Pick a action that you want to perform on your project', name: 'Action')
  }

  stages {

    stage('Checkout') {
      steps {
          checkout scm
      }  
    }

    stage('apply terraform') {
        steps {
            script {
                if (params.Action == "Build"){
                    sh """
                       terraform get -update
                       terraform init
                       terraform workspace new ${params.Project}
                       terraform workspace list
                       terraform workspace select ${params.Project}
                       terraform apply -input=false
                    """    
                }
                else {
                    sh """
                       terraform workspace select ${params.Project}
                       terraform destroy -auto-approve
                       terraform workspace select default
                       terraform workspace delete ${params.Project}  
                    """
                }
            }
        }
    }

  } 


}