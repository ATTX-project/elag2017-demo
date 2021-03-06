
#!/bin/bash

# Wait for MySQL
dockerize -wait tcp://mysql:3306 -timeout 240s

# Wait till Tomcat startup has finished and webapps are started (max 3 minutes)
i=0
until $(curl --output /dev/null --silent --head --fail --user $MASTER_USER:$MASTER_PASSWORD http://frontend:8080/master/api/1/pipelines) || [ "$i" -gt 36 ]; do
    i=$((i+1))
    printf '.'
    sleep 5
done

# Add Pipelines
for f in /data/*.zip; do bash /usr/local/bin/add-pipeline.sh "$f"; done
