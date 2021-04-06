#!groovy

@Library('alayacare@v0.7.24') _

node('build') {
    def dockerImage
    String repository = env.JOB_NAME.split('/')[1]

    try {
        String buildTag = UUID.randomUUID().toString()
        dockerLockName = "docker_lock_${buildTag}"

        stage('Git Checkout') {
            checkout scm
        }

        stage('Build Docker Image') {
            dockerImage = docker.build(buildTag)

        }

        try {
            // only push when building by branch and if tests pass
            lock(dockerLockName) {
                ci.pushDockerImageToRegistry(dockerImage: dockerImage, repository: repository)
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
        lock(dockerLockName) {
            if (dockerImage) {
                sh("docker rmi ${dockerImage.id} || true")
            }
        }

        cleanWs()
    }
}
