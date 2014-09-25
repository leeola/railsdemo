
# Rails + Postgres + Mixpanel

FOR DEMO PURPOSES ONLY

## Installation

Run the following commands in your Koding Terminal to install Rails, 
clone this repo, and then install the gem dependencies.

```
sudo apt-get install rails libpq-dev
git clone https://github.com/leeolayvar/railsdemo
cd railsdemo
bundle install
```

## Configuration: Mixpanel

After creating a Mixpanel account, go to your Account Settings and locate 
your API Key, Secret, and Token. Next, open the file located at:

```
app/controllers/mixpanel_controller.rb
```

Replace `YOUR_API_TOKEN`, `YOUR_API_KEY`, `YOUR_API_SECRET` with the 
information from your Mixpanel account settings.

## Configuration: PostgreSQL

Open the following file:

```
config/database.yaml
```

And replace `DATABASE_NAME`, `DATABASE_USER`, `DATABASE_PASS`,
`DATABASE_HOST` with the proper database information. Note that if you're 
using a local database *(installed on the same machine)*, `localhost` is 
the expected value.

If you don't have a database setup, see the sections below for basic 
installation steps.

After you have configured the database settings, run the following 
command from this project directory.

```
rake db:migrate
```


## Running your Rails Server

Run the following command from this project directory.

```
rails server -p 3001
```

Then open your browser and connect to your VM Address. You can find this 
by clicking on the link located in your [VM 
Settings](http://take.ms/G6w2n).

## Installing your own Postgres Server

Run the following command in your Koding Terminal to install PostgreSQL.

```
sudo apt-get install postgresql
```

After that, you'll need to create a user for Rails to loginto Postgres 
with. Run the following commands..

```
sudo su - postgres
psql
```

You'll now be in the Postgres Prompt. Run the following command, 
replacing `DATABASE_USER` and `DATABASE_PASS` with whatever login 
information you want.

```
create role DATABASE_USER with createdb login password 'DATABASE_PASS';
```

**NOTE**: Your username should be all lowercase.

Now open up a new Terminal, and head to your rails installation folder 
from above. Locate the `config/database.yaml` file, and open it up. It 
should look like the following:

```
development:
  adapter: postgresql
  encoding: unicode
  database: DATABASE_NAME
  pool: 5
  username: DATABASE_USER
  password: DATABASE_PASS
  host: DATABASE_HOST
```

Replace the host with `localhost`, the user/pas information with what you 
created above, and the database name as whatever you want to create.

After that, in the rails project directory, type the following command.

```
rake db:setup
```

This will create the DB, and tables/etc. After that, simply run your 
rails server with the above instructions!


## Using Postgres as a Service

If you're unfamiliar with Database Setup, Heroku has a zero installation 
Postgres database that you can use. Simply signup at 
[heroku.com](http://heroku.com) and visit your [Database 
Settings](https://postgres.heroku.com/databases). From there, create a 
database and enter the connection settings into the Database 
Configuration step above. Don't forget use the Host that they supplied.
