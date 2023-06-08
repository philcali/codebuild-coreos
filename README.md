# Example CoreOS Build

## Build Locally

Create the build container image

```
docker -t coreos-builder .
```

Pull the local agent script:

```
curl -O https://raw.githubusercontent.com/aws/aws-codebuild-docker-images/master/local_builds/codebuild_build.sh
```

Run the build

```
./dev.build-coreos.sh
```

## Build in the cloud

1. Publish the build image
2. Create the pipeline and build using the image
