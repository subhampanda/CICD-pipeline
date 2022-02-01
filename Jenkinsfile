@Library('cop-pipeline-step') _
@Library('cop-pipeline-bootstrap') __

pipeline{

    agent any

    environment {
	 
           AWS_ROLE = "db-prod-preprod-cicd-jenkins"
           AWS_REGION='us-east-2'
           AWS_ACCOUNT = '947666650043'
           AWS_ENVIRONMENT = "preprod"
           STACK_NAME = "test"
	   APP_NAME = 'lm-dbrefresh-core-dni'
	   STATE_BUCKET_PREFIX='lm-dbrefresh-core-dni'
    }
	
    stages {


 stage('********************************************Create Snapshot & Restore********************************************') 
          {  
            steps {
                 genericBuild(
                    image: 'hashicorp/terraform:latest',
                    cmd: 'cd ./infrastructure && \
                    terraform init  -input=false -reconfigure -backend-config=region="${AWS_REGION}" -backend-config=bucket="${STATE_BUCKET_PREFIX}"-"${AWS_ENVIRONMENT}"-state -backend-config=workspace_key_prefix="${APP_NAME}"-"${AWS_ENVIRONMENT}" -backend-config=key=lm-mmx-dni && \
		    terraform destroy -auto-approve && \
	            terraform plan -input=false -out=lm-mmx-tfplan.tfplan && \
                    terraform apply lm-mmx-tfplan.tfplan',
                    aws: [
                        roleAccount:"${AWS_ACCOUNT}",
                        role: "${AWS_ROLE}",
                        region: "${AWS_REGION}"
                    ]
                 )
            }
        }       
	}	
}
