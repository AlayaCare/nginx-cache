#!groovy

node('build') {
    def dockerImage
    String branchName
    Boolean shouldPushImage = false

    if (env.CHANGE_ID) {
        // pull request build
        branchName = CHANGE_BRANCH
        shouldPushImage = false
    } else {
        // branch build
        branchName = BRANCH_NAME
        shouldPushImage = true
    }

    try {
        String dockerTag = 'alayacare/nginx-proxy:' + branchName.replaceAll('/', '-')

        stage('Git Checkout') {
            checkout scm
        }

        stage('Build Docker Image') {
            dockerImage = docker.build(dockerTag)
        }

        try {
            // only push when building by branch and if tests pass
            docker.withRegistry('https://quay.io', 'quay-jenkins') {
                dockerImage.push()
            }
        } catch(exception) {
            println(exception)
            throw exception
        } finally {
        }
    } catch(exception) {
        println(exception)
        throw exception
    } finally {
        cleanWs()
    }
}

