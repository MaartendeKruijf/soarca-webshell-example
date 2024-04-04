# SOARCA Webshell example

This repo contains a webshell example for SOARCA. The included python code will create a webserver which can be used for shell commands.

The playbooks will lookup the ip on virustotal and kill the process and remove the file.


## Setup with docker compose
Confirmed working on Ubuntu 22.04 

```bash
export PORT=8080
docker compose build --no-cache
docker compose up -d --force-recreate 
```

## Webshell usage
To load the webpage go to your url/ ip of your server on the port that you configured.
```
http://127.0.0.1:8080
```


To Execute commands use the `?` 
```
http://127.0.0.1:8080?ls
```

## Playbook 
Execute playbook `playbook--300270f9-0e64-42c8-93cc-0927edbe3ae7_remove.json` to remove the webshell.