FROM busybox:latest
RUN mkdir -p /home/root
RUN echo 'export PS1="[built with kaniko from https://gitlab.com/guided-explorations/gitlab-ci-yml-tips-tricks-and-hacks/kaniko-docker-build/] \W # "' >> /home/root/.profile

CMD echo 'Built with kaniko from https://gitlab.com/guided-explorations/gitlab-ci-yml-tips-tricks-and-hacks/kaniko-docker-build/'
