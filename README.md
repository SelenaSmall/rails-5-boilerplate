# README

Base project for apps written in Rails 5 set up to utilise the Devise and Pundit gems for authentication and authorisation. This base is configured with a seed user, 3 roles which can be easily updated. It also boasts a sample controller and views utilising bootstrap styles for login and user creation.

--------------------------------------------------------------
QUICKSTART GUIDE
--------------------------------------------------------------
Clone this repo to your local machine, run $ bundle install, fire up the rails server and view the sample application on http://localhost:3000/

For more detailed installation instruction see below:


--------------------------------------------------------------
STEP BY STEP INSTRUCTIONAL GUIDE
--------------------------------------------------------------
Ensure you have rails 5.0.1 and ruby 2.3.3 installed. Use rvm to switch Ruby versions as per guides 
Clone repo to your local machine. 
Make a fresh repo - ie remove all .git files and run a new git init as per the github guides
Ensure you have bundler installed and from the command line run Bundle Install to install all require dependencies.
Start the server $ rails s
View your blank application on http://localhost:3000/

Routes point to home/index as default home page

Application controller requires an authenticated user to view the app

Application.html.erb controls overall layout for application, include nav bar styled by bootstrap

User.rb defines user roles as enums and devise applicable to users

Migration 'create_seed_user' initialises credentials for seed admin user

Pundit update the application controller and creates an Application policy for which user roles can view what pages/ data.

Present styles can be easily modified in the stylesheets directory. I have tried to use as few classes as possible and ensured that all styles are also responsively designed.

User Management Capabilities are linked to the User Controller. An Index page will list all of the Users, while New user can be created by Admin and Invited to join the aplication with Pundit 'invitable' feature.

Devise_invitable https://github.com/scambra/devise_invitable allows new users to join the applicaiton upon invitation sent by email. Invitation emails are formated in views/users/invitations and views/users/mailer

Devise.registerable allows users to sign up to the applicaiton. The sign up link is located in app/views/devise/shared/_links 

Esnure you follow the set up instructions for devise_invitable and that the following config fields are correct in your initializer/devise.rb:
config.mailer_sender = 'example@test.com'
config.scoped_views = true

To include icons in your application like the downloadables from icomoon.com, you must follow the rule for the Asset Pipeline which Rails depends on for compiling assets. 
1. After choosing the icons you want to include in your application at icomoon.com, you'll download and unzip the file. 
2. Copy the 'fonts' folder across to your app/assets/ directory.
3. Ensure you have the config variables set in to access this folder your config/initializers/assests.rb and app/assets/manifest.js
4. Set @font-face in assets/stylesheets/application.scss
5. See how to display your newly added icons in views/layouts/application.html.erb


--------------------------------------------------------------
TBD
- Assest Pipeline
--- Include icons from icomoon.com
	config/initializers/assests.rb
	app/assets/manifest.js

- Config Instructions for secrets.yml, database.yml, .gitignore
- Deployment config
--- Deploy environment settings
--- Capistrano, RDS & EC2/
--- JRuby & Lambda

-- Configure a Dockerfile for local development, in which case you just run docker
- On Screen Instruction Set to get started

--------------------------------------------------------------
--------------------------------------------------------------

Largely standard as per the rails guides:

* Ruby version 2.3.3, Rails version 5.0.1

* System dependencies 
	- rvm/  see gemfile
	- gems: Devise, Pundit, Bootstrap

* Configuration
	Esure you have postgres setup on your machine with a user. You can following the following example to get set up: https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres
	- update db config values in the config/database.yml

* Database creation 
	- Postgres

* Database initialization 
	- Rake

* How to run the test suite 
	- Rspec?

* Services (job queues, cache servers, search engines, etc.) 

* Deployment instructions
	- Ngrok? **
	- Heroku? **
	- Lambda? **

--------------------------------------------------------------
--------------------------------------------------------------
** Maybe I should run the build with Docker integration too? **
