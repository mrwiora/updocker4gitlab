docker run --detach \
    --hostname code.domain.tld \
    --publish 80:80 --publish 443:443 --publish 22:22 \
    --env GITLAB_OMNIBUS_CONFIG='external_url "https://code.domain.tld/";' \
    --name gitlab \
    --restart unless-stopped \
    --volume /docker/gitlab/config:/etc/gitlab \
    --volume /docker/gitlab/logs:/var/log/gitlab \
    --volume /docker/gitlab/data:/var/opt/gitlab \
    registry.hub.docker.com/gitlab/gitlab-ce:latest
