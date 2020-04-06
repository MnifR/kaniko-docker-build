FROM busybox:latest
RUN mkdir -p /home/root

CMD echo 'Built with kaniko from https://gitlab.com/guided-explorations/gitlab-ci-yml-tips-tricks-and-hacks/kaniko-docker-build/'
