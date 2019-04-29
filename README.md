# Slavery.virginia.edu

These are the docker files for running slavery.virginia.edu on beagle.

# Requirements
- docker
- a copy of the wp-content folder containing all of the themes, plugins, and
  uploaded files
- a copy of the database as an .sql file

# File structure

```
├── .README.md
├── .env 
├── Dockerfile
├── docker-compose.yml
├── initial_sql
├── slavery_db_data
└── wp-content
```

- `.env` = a file containing the MySQL username and password, just to keep it out of version control
- `Dockerfile` = used to build the WordPress image with sendmail so it can send emails for lost passwords and such
- `docker-compose.yml` = the compose file for putting the db and wp containers
  together
- `initial_sql` = folder containing the original database file. only used the first time this is run on beagle. after the first time, the database is stored in local volume `slavery_db_data` folder
- `wp-content` = the folder containing all the theme, plugins, and uploaded content
- `slavery_db_data` = folder containing all the database files so that they are persistant across container restarts


## Production & Development

To run this in production (beagle.lib) or development (your laptop), you need a copy of wp-content and a dump of the
database. Grab these from the production server. The production server will
already have these.

Create a `.env` file with this content:

```
DB_NAME=slavery
DB_PASS=password
DB_USER=username
```

Then run docker-compose:

- `docker-compose up`

or 

- `docker-compose up -d` to run in the background

# Notes:
- Added the DB_CHARSET value to the docker-compose, which adds that setting
  into the wp-config.php file. Set this explicitly to 'latin1' because of
  issues with encoding from the old MySQL database to the 'new'. The web page
  was rendering some characters incorrectly, but explicitly setting this value
  fixes those issues. 
