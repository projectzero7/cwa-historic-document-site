# Civil Works Administration Historical Document Site

## Development

First, install the necessary dependencies

`bundle install --without production`

Next, update your database

`rake db:schema:load`

Finally, launch the server locally

`rails -s`

## Deployment to Heroku

The website is already configured to work with Heroku. First, you must create a Heroku project. Next, you must add the PostgreSQL add-on to the project through the Heroku dashboard. Then you are ready to push to Heroku. Make sure to migrate the Heroku database to make the application work.
