node{
    def project = 'copper-imprint-193208'
    def appName = 'helloapidemo'
    def tag = "v_${env.BUILD_NUMBER}"
    def img = "gcr.io/${project}/${appName}-${env.BRANCH_NAME}"
    def imgWithTag = "${img}:${tag}"
    
    checkout scm

    stage 'Build Docker'
    powershell("docker build -t ${imgWithTag} .")

    stage 'Push Docker'
    powershell("gcloud docker -- push ${imgWithTag} ")
}