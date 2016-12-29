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

--------------------------------------------------------------
TBD
--------------------------------------------------------------
- Base Styling 
- User Management Capabilities: INCL creation of new users/ invitable?/ User controller based on DeviseCreateUsers migration?
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

--------------------------------------------------------------
--------------------------------------------------------------
** Maybe I should run the build with Docker integration too? **
