# PostGIS Workbench
a docker-compose project to quickly set up a [Postgresql](http://postgresql.org/) database with [PostGIS](https://postgis.net) extention and [PostgREST](https://postgrest.org/en/v7.0.0/index.html) as protocol bridge

### requires
* docker-compose


### install
running `bin/install.sh` will add three new scripts (see below) in `/usr/local/bin`


### Scripts

* `pgis_ws_set_init_path.sh $path ` 
    
    with a (relative or absolute _$path_) sets the with SQL scripts used to initialize the postgres-database.

* `pgis_ws_reset.sh ` 
    
   restarts the whole environment (inkluding database) from scratch, using all the Sql files in the configured directory.
   The workdir for this script must include a file .env, which is passed to the containers. See configuration below:

* `pgis_ws_stop.sh ` 

   stops all containers.
   
   
### the env file
... located in the folder where `pgis_ws_reset.sh `  is run.
```
# Username and Password for the root user to connect to your database
POSTGRES_PASSWORD=secretRootPassword
POSTGRES_USER=postgres

# Username and password PostgREST will use to connect
PGRST_DB_USER=authenticator
PGRST_DB_PASSWORD=passwordForAuthenticator

# Database name
DATABASE=postgres

# Schema, PostgREST should connect to
PGREST_DB_SCHEMA=api

# The JWT-Secrets the token are signed with
JWT_SECRET=iuhosauhuisvbdjlfghdsailbcadsilioidfsapifdockergdsauobsduhacosspancisaphfdusioafhdsuaicouunhdosuinfghsaubcdgfzubdgsazuisdufndjjhdjskkksa

# The "external" URI for PostgREST as it appears in the swagger documentation
SERVER_PROXY_URI=http://localhost:11000

```


For more configiration options, please have a look at [PostgREST Dockerfile](https://github.com/PostgREST/postgrest/blob/d4aba5cb08d4373eca92ceed5e583c984fd01cf0/docker/Dockerfile) and the configuration section of the PosgREST [docs](http://postgrest.org/en/v7.0.0/configuration.html).

