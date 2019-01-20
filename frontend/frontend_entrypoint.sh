# entrypoint.sh

#!/bin/bash
# Docker entrypoint script.


until cd frontend
do
   echo "$(date) - waiting for moving to the backend folder"
   sleep 2
done

if [ ! -d "node_modules" ]; then
   yarn install
fi

#yarn global add @vue/cli

yarn serve