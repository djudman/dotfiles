alias ll="ls -la"

# Game Insight
alias shell="\
    docker run -it --rm -d \
        -v /Users/dorofeev/gi:/opt/src:delegated \
        -v /var/run/docker.sock:/var/run/docker.sock \
        --mount source=shell,target=/home/master \
        --network drako-local \
        --group-add 0 \
        --name shell.local \
        gitlab.fz.vc:5555/q1/docker/shell; \
    docker cp ~/.ssh shell.local:/home/master; \
    docker exec -it --user=root shell.local chown -R master: /home/master/.ssh; \
    docker attach shell.local"

alias drako.httpd="\
    docker run -it --rm -d -p 8080:8080 \
        -v /Users/dorofeev/gi:/opt/src:delegated \
        -v /var/run/docker.sock:/var/run/docker.sock \
        --mount source=shell,target=/home/master \
        --network drako-local \
        --group-add 0 \
        --name drako.httpd \
        gitlab.fz.vc:5555/q1/docker/shell; \
    docker exec -it drako.httpd drako test.httpd --bind 0.0.0.0;
    docker stop drako.httpd"
