node {
   deleteDir()
   stage('Preparation') {
     checkout scm
     downloadTerraform()
     env.PATH = "${env.PATH}:${env.WORKSPACE}"
   }
   stage('Plan') {
   
     withCredentials([usernamePassword(credentialsId: 'aws-keys', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) {
        sh """
          terraform init        
          terraform plan -out plan.plan
        """
      }
     
   }
   
   stage('Apply') {
     withCredentials([usernamePassword(credentialsId: 'aws-keys', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) {
        sh """          
          terraform apply plan.plan
        """
      } 
   }
   
   
}

def downloadTerraform(){
  if (!fileExists('terraform')) {
    sh "curl -o  terraform_0.10.7_linux_amd64.zip https://releases.hashicorp.com/terraform/0.10.7/terraform_0.10.7_linux_amd64.zip && unzip -o terraform_0.10.7_linux_amd64.zip && chmod 777 terraform"
  } else {
    println("Huh! Terraform Exists")
  }
}

