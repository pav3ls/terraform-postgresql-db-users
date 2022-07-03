# Create DBs and users by terraform for PosgreSQL

A user is created for each database

## Docker PostgreSQL run example:
```
docker run --name postgresql-dev -e POSTGRES_USER="postgres" -e POSTGRES_PASSWORD="mypassword" -p 5432:5432 -v /data:/home/user/postgresql-data -d postgres
```
