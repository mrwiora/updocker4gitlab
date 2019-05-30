docker exec -it gitlab /bin/bash
docker exec -t gitlab gitlab-ctl stop unicorn
docker exec -t gitlab gitlab-ctl stop sidekiq
docker exec -t gitlab gitlab-rake gitlab:backup:restore BACKUP=1537823416_2018_09_24_11.3.0