# cron-docker

## Run

`docker compose build && docker compose up`

## Issue

Cron job does not output 'Hello world' every minute. Is also restarts itself.

```
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS                          PORTS     NAMES
8394fa79b16d   cron_repo-cron   "/bin/sh -c cron"   10 minutes ago   Restarting (0) 35 seconds ago             cron_repo-cron-1
```
