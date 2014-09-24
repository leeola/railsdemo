
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

## Using Postgres as a Service

If you're unfamiliar with Database Setup, Heroku has a zero installation 
Postgres database that you can use. Simply signup at 
[heroku.com](http://heroku.com) and visit your [Database 
Settings](https://postgres.heroku.com/databases). From there, create a 
database and enter the connection settings into the Database 
Configuration step above. Don't forget use the Host that they supplied.
