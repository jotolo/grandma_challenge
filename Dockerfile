FROM ruby:2.5.1

RUN mkdir /grandma
ENV APP_DIR /grandma
#ENV BUNDLE_PATH /box

# Set the working directory to /cronvo
WORKDIR $APP_DIR

ADD Gemfile $APP_DIR/Gemfile
ADD Gemfile.lock $APP_DIR/Gemfile.lock

# Copy the current directory contents into the container at /cronvo
#ADD ./ $APP_DIR
ADD . $APP_DIR

RUN echo "gem: --no-rdoc --no-ri" >> ~/.gemrc
RUN rm -r tmp
RUN gem install bundler
RUN bundle check || bundle install -j 4

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Define environment variable
#ENV NAME World

### Helpers:
# Remove all containers:
# $ docker rm $(docker ps -qa)
# Remove all untagged images:
# $ docker rmi -f $(docker images | grep '^<none>' | awk '{print $3}')
###

CMD ["bash", "-c", "rake db:create; rake db:migrate; rake db:seed; rake assets:precompile && rails s -p 3000 -b '0.0.0.0'"]