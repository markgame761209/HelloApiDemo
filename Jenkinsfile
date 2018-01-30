node{
    def project = 'copper-imprint-193208'
    def appName = 'helloapidemo'
    def tag = "v_${env.BUILD_NUMBER}"
    def img = "gcr.io/${project}/${appName}-${env.BRANCH_NAME}"
    def imgWithTag = "${img}:${tag}"
    
    checkout master

    stage 'Build Docker'
    sh("docker build -t ${imgWithTag} .")

    stage 'Push Docker'
    sh("gcloud docker -- push ${imgWithTag} ")
}