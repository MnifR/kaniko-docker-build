# Kaniko Docker Builds

## If This Helps You, Please Star This Project :)

One click can help us keep providing and improving Guided Explorations.  If you find this information helpful, please click the star on this project's details page! [Project Details](https://gitlab.com/guided-explorations/containers/kaniko-docker-build)

## Guided Explorations Concept

This Guided Exploration is built according to a specific vision and requirements that maximize its value to both GitLab and GitLab's customers.  You can read more here: [The Guided Explorations Concept](https://gitlab.com/guided-explorations/guided-exploration-concept/blob/master/README.md)

## Working Design Pattern

As originally built, this design pattern works and can be tested. In the case of plugin extensions like this one, the working pattern may be it's use in another Guided Exploration.

## Overview Information

GitLab's features are constantly and rapidly evolving and we cannot keep every example up to date.  The date and version information are published here so that you can assess if new features mean that the example could be enhanced or does not account for an new capability of GitLab.

* **Product Manager For This Guided Exploration**: Darwin Sanoy (@DarwinJS)

* **Publish Date**: 2020-04-06

* **Last Update**: 2020-05-17

* **Exploration Version**: v1.2.0

* **GitLab Version Released On**: 12.10

* **GitLab Edition Required**: 

  * For overall solution: [![FC](https://gitlab.com/guided-explorations/guided-exploration-concept/-/raw/master/images/FC.png)](https://about.gitlab.com/features/) 

    [Click to see Features by Edition](https://about.gitlab.com/features/) 

- **Tested On**: 
  - GitLab Docker-Executor Runner (GitLab.com Shared Runner) without enabling DinD Service.
  - GitLab Kubernetes Runner without enabling DinD Service.

* **References and Featured In**:
  * [Least Privilege Container Builds with Kaniko on GitLab](https://www.youtube.com/watch?v=d96ybcELpFs)
  
## Demonstrates These Design Requirements, Desirements and AntiPatterns

- **Development Pattern:** Use Kaniko to build containers to avoid running Docker daemon in priviledged mode. and push to internal Gitlab Container Registry or Docker Hub (external registry example).
- **Docker Development Pattern:** Attempts to comply with opencontainers labelling: https://github.com/opencontainers/image-spec/blob/master/annotations.md#back-compatibility-with-label-schema
- **GitLab Development Pattern [![FC](https://gitlab.com/guided-explorations/guided-exploration-concept/-/raw/master/images/FC.png)](https://about.gitlab.com/features/):** Use Kaniko to build containers and push to internal Gitlab Container Registry or Docker Hub (external registry example) discussed here: https://docs.gitlab.com/ee/ci/docker/using_kaniko.html 
- **GitLab Development Pattern [![FC](https://gitlab.com/guided-explorations/guided-exploration-concept/-/raw/master/images/FC.png)](https://about.gitlab.com/features/):** Image Tagging with key GitLab CI information
- **GitLab Development Pattern [![FC](https://gitlab.com/guided-explorations/guided-exploration-concept/-/raw/master/images/FC.png)](https://about.gitlab.com/features/):** Image Labeling with additional GitLab CI build meta data
- **Docker Development Pattern [![FC](https://gitlab.com/guided-explorations/guided-exploration-concept/-/raw/master/images/FC.png)](https://about.gitlab.com/features/):** Adding set of arbitrary tags in space delimited variable (compact and flexible)
- **Docker Development Pattern [![FC](https://gitlab.com/guided-explorations/guided-exploration-concept/-/raw/master/images/FC.png)](https://about.gitlab.com/features/) (v1.2.0):** Add the git version tag - either with the last available version tag in git or ONLY if the current commit has a version (configurable)
- **Development Pattern [![FC](https://gitlab.com/guided-explorations/guided-exploration-concept/-/raw/master/images/FC.png)](https://about.gitlab.com/features/) (v1.2.0):** Adding "latest" tag only when building master branch.
- **GitLab Development Pattern [![FC](https://gitlab.com/guided-explorations/guided-exploration-concept/-/raw/master/images/FC.png)](https://about.gitlab.com/features/):** Using variable scoping to override specific variables discussed here: https://docs.gitlab.com/ee/ci/variables/#limiting-environment-scopes-of-environment-variables
- **Development Pattern [![FC](https://gitlab.com/guided-explorations/guided-exploration-concept/-/raw/master/images/FC.png)](https://about.gitlab.com/features/):**  Clean, reusable code for good image labelling and tagging - including being explicit about the only difference between docker and kaniko tagging argument (--tag in docker becomes --destination in kaniko) so code is reusable with Docker in Docker implementations.

#### GitLab CI Functionality:

- **.gitlab-ci.yml** "environment:" ![FC](https://gitlab.com/guided-explorations/guided-exploration-concept/-/raw/master/images/FC.png)to allow variables to have alternate values depending on environment scope discussed here:: https://docs.gitlab.com/ee/ci/yaml/#environment
- **.gitlab-ci.yml** "trigger:include:" ![FC](https://gitlab.com/guided-explorations/guided-exploration-concept/-/raw/master/images/FC.png) enabling dynamically generated yml to be run.

## Using This Pattern
- If you copy this repo, to leverage the build to docker, you must setup the following CI CD Variables:

  | Type     | Key                  | Value                       | Protected | Masked | Scope              |
  | -------- | -------------------- | --------------------------- | --------- | ------ | ------------------ |
  | Variable | CI_REGISTRY          | https://index.docker.io/v1/ | No        | No     | push-to-docker-hub |
  | Variable | CI_REGISTRY_IMAGE    | docker.io/youruser/yourrepo | No        | No     | push-to-docker-hub |
  | Variable | CI_REGISTRY_PASSWORD | yourpassword                | No        | Yes    | push-to-docker-hub |
  | Variable | CI_REGISTRY          | https://index.docker.io/v1/ | No        | No     | push-to-docker-hub |
  | Variable | CI_REGISTRY_USER     | Yourdockeruserid            | No        | No     | push-to-docker-hub |

## Cross References and Documentation

- GitLab Kaniko Documentation: https://docs.gitlab.com/ee/ci/docker/using_kaniko.html
- Kaniko Documentation (to go beyond the basic example in GitLab documentation): https://github.com/GoogleContainerTools/kaniko/blob/master/README.md
- List of possible Kaniko containers to use (remember it must be tagged "debug"): https://console.cloud.google.com/gcr/images/kaniko-project/GLOBAL/executor

## Other Possible Uses

* push to various registries (like dev versus prod) using branches and variable scoping for altering the location and logon information.  This can keep production registries cleaner and allow cleanup of development registries to be safer because deleting the risk of deleting a production in-use container is dramatically reduced.
