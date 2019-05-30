# updocker4gitlab (to be reused for any other docker image)

These scripts allows you to implement an automated (e.g. cron-based) update checker for your gitlab docker instance.

## Scripts

d_gitlab_updatechecker.sh

> checks online for the latest gitlab version available on dockerhub and in case that a newer version is available it gets downloaded and triggers d_gitlab_update.sh

d_gitlab_update.sh 

> stops the current gitlab container, renames it to gitlab_oldimageid and starts the new one via d_gitlab_start.sh

d_gitlab_start.sh

> starts the new container with the defined environment and mapping defintions

## Automated call

Scripts can be called hourly via cron (dockeruser must have permissions to execute docker tasks (```usermod -aG docker standarduser```)):

```bash
0 * * * *       standarduser    /docker/gitlab/scripts/d_gitlab_updatechecker.sh >> lastexec_output
```