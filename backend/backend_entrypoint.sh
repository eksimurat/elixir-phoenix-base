# entrypoint.sh

#!/bin/bash
# Docker entrypoint script.

# Wait until Postgres is ready
while ! pg_isready -q -h $PGHOST -p $PGPORT -U $PGUSER
do
  echo "$(date) - waiting for database to start"
  sleep 2
done

# Create, migrate, and seed database if it doesn't exist.
if [[ -z `psql -Atqc "\\list $PGDATABASE"` ]]; then
  echo "Database $PGDATABASE does not exist. Creating..."
  createdb -E UTF8 $PGDATABASE -l en_US.UTF-8 -T template0
  mix ecto.migrate
  mix run priv/repo/seeds.exs
  echo "Database $PGDATABASE created."
fi


until cd backend
 do
   echo "$(date) - waiting for moving to the backend folder"
   sleep 2
 done

# until cd assets
# do
#   echo "$(date) - waiting for moving to the assets folder"
#   sleep 2
# done



# if [ ! -d "node_modules" ]; then
#   npm install
# fi


if [ ! -d "deps" ]; then
   mix deps.get
fi



mix phx.server