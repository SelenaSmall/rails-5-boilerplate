# IVR App
FROM ruby:2.4.1

ARG RAILS_ENV
# set app environment
ENV RAILS_ENV $RAILS_ENV

# Install dependencies
# - build-essential: To ensure certain gems can be compiled
# - nodejs: Compile assets
# - libpq-dev: Communicate with postgres through the postgres gem
RUN apt-get clean && apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
    libpq-dev \
    sendmail

# Set an environment variable where the Rails app is installed to inside of Docker image
ENV APP_HOME /var/www/boilerplate
RUN mkdir -p $APP_HOME
# Set working directory, where the commands will be run:
WORKDIR $APP_HOME

# Gems:
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN if [ "$RAILS_ENV" != "development" ] &&  [ "$RAILS_ENV" != "test" ]; then bundle install --without development test; fi

# Copy the main application
COPY . .

# Compile the assets
RUN if [ "$RAILS_ENV" != "development" ] &&  [ "$RAILS_ENV" != "test" ]; then bundle exec rake assets:precompile; fi

VOLUME ["$APP_HOME/public"]
# In production you will very likely reverse proxy Rails with nginx.
# This sets up a volume so that nginx can read in the assets from
# the Rails Docker image without having to copy them to the Docker host.

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/www/boilerplate/log/csrd.log

EXPOSE 3000

# ENTRYPOINT bin/entry
# The default command that gets ran will be to start the Puma server.
CMD ["bin/entry"]
