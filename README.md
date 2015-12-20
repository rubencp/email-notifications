New Email Notificatins for Shopify
=======================

Getting Started
---------------


After Cloning the repository

Be sure that your Gemfile has the Ruby version that you have installed
in this case I am using 2.2.1

```
bundle install 
```

```
rake db:migrate
```
To run the application call:

```
 foreman run bundle exec rackup config.ru
```

Setup Heroku
---------------
Create your Heroku App and add the path as a remote


 git remote add heroku git@heroku.com:email-notifications.git

 git remote add heroku git@heroku.com:<Name-of-your-app>.git

if it denies the aces maybe the SSH keys have not been set up, try:
heroku keys:add    

After creating your new application you need to edit the .env file and add the following lines:

```
SHOPIFY_API_KEY=<your api key>
SHOPIFY_SHARED_SECRET=<your shared secret>
SHOPIFY_REDIRECT_URI="<your redirect_uri>"
SECRET=<generate a random string to encrypt credentials with>
```

SHOPIFY_REDIRECT_URI=https://43ab1bb5.ngrok.com/auth/shopify/callback

If your app has any other secret credentials you should add them to this file.


Setup Heroku
---------------


```
 ngrok 4567
```


ToDo: make a configuration file
 ngrok -config=ngrok.yml start email-notifications 

 Use this url as the target on the shopify configuration

Application URL
 https://43ab1bb5.ngrok.com

Redirection URL (redirect_uri )
 https://43ab1bb5.ngrok.com/auth/shopify/callback


Install App to Store
----------------------

access the application from the https Application URL

IMPORTANT NOTE: If debuging the application, do not try to install it from localhost:4567 since it will throw an error after the redirection. use the Shopify public url.



