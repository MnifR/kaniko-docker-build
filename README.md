# Kaniko Docker Builds

## Guided Explorations Concept

This Guided Exploration is built according to a specific vision and requirements that maximize its value to both GitLab and GitLab's customers.  You can read more here: [The Guided Explorations Concept](https://gitlab.com/guided-explorations/guided-exploration-concept/blob/master/README.md)

## Working Design Pattern

As originally built, this design pattern works and can be tested. In the case of plugin extensions like this one, the working pattern may be it's use in another Guided Exploration.

## Overview Information

GitLab's features are constantly and rapidly evolving and we cannot keep every example up to date.  The date and version information are published here so that you can assess if new features mean that the example could be enhanced or does not account for an new capability of GitLab.

* **Product Manager For This Guided Exploration**: Darwin Sanoy (@DarwinJS)

* **Publish Date**: 2020-04-06

* **GitLab Version Released On**: 12.10

* **GitLab Edition Required**: 

  * For overall solution: [![FC](https://gitlab.com/guided-explorations/guided-exploration-concept/-/raw/master/images/FC.png)](https://about.gitlab.com/features/) 

    [Click to see Features by Edition](https://about.gitlab.com/features/) 

* **References and Featured In**:

  
## Demonstrates These Design Requirements, Desirements and AntiPatterns

- **Development Pattern:** Use Kaniko to build containers to avoid running Docker daemon in priviledged mode. and push to internal Gitlab Container Registry or Docker Hub (external registry example).
- **GitLab Development Pattern [![FC](https://gitlab.com/guided-explorations/guided-exploration-concept/-/raw/master/images/FC.png)](https://about.gitlab.com/features/):** Use Kaniko to build containers and push to internal Gitlab Container Registry or Docker Hub (external registry example) discussed here: https://docs.gitlab.com/ee/ci/docker/using_kaniko.html 

  > **However, this example's code is more secure than the Kaniko example repeated in the GitLab documentation.** 
- **GitLab Development Pattern [![FC](https://gitlab.com/guided-explorations/guided-exploration-concept/-/raw/master/images/FC.png)](https://about.gitlab.com/features/):** Image Tagging with key GitLab CI information
- **GitLab Development Pattern [![FC](https://gitlab.com/guided-explorations/guided-exploration-concept/-/raw/master/images/FC.png)](https://about.gitlab.com/features/):** Image Labeling with additional GitLab CI build meta data
- **Development Pattern [![FC](https://gitlab.com/guided-explorations/guided-exploration-concept/-/raw/master/images/FC.png)](https://about.gitlab.com/features/):** Adding set of arbitrary tags in space delimited variable (compact and flexible)
- **GitLab Development Pattern [![FC](https://gitlab.com/guided-explorations/guided-exploration-concept/-/raw/master/images/FC.png)](https://about.gitlab.com/features/):** Using variable scoping to override specific variables discussed here: https://docs.gitlab.com/ee/ci/variables/#limiting-environment-scopes-of-environment-variables

#### GitLab CI Functionality:

- **.gitlab-ci.yml** "environment:" ![FC](https://gitlab.com/guided-explorations/guided-exploration-concept/-/raw/master/images/FC.png)to allow variables to have alternate values depending on environment scope discussed here:: https://docs.gitlab.com/ee/ci/yaml/#environment
- **.gitlab-ci.yml** "trigger:include:" ![FC](https://gitlab.com/guided-explorations/guided-exploration-concept/-/raw/master/images/FC.png) enabling dynamically generated yml to be run.

## Using This Pattern
- To see more than one sub-job, specify `JOB_NUM` for the number of jobs in the downstream pipeline before you run the pipeline

## Cross References and Documentation

- GitLab Kaniko Documentation: https://docs.gitlab.com/ee/ci/docker/using_kaniko.html
- Kaniko Documentation (to go beyond the basic example in GitLab documentation): https://github.com/GoogleContainerTools/kaniko/blob/master/README.md
- List of possible Kaniko containers to use (remember it must be tagged "debug"): https://console.cloud.google.com/gcr/images/kaniko-project/GLOBAL/executor

## Other Possible Uses

* push to various registries (like dev versus prod) using branches and variable scoping for altering the location and logon information.  This can keep production registries cleaner and allow cleanup of development registries to be safer because deleting the risk of deleting a production in-use container is dramatically reduced.