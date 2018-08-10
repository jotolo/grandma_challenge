# 🍪 Loanlink Web Engineering Challenge

## Overview
Grandma wants to store all of her family recipes, but keeps losing her old recipe book. We're brinding grandma into the digital age by building her a web app where she can keep her recipes on the web!



### Requirements

Grandma isn't picky, there are only a few things she needs:

- [X] Allow her add new receipes (In a browser - if the page is refreshed, the saved recipes should persist)
- [X] Allow her user edit an existing recipe (in a browser)
- [X] Allow her to remove an existing recipe (in a browser)
- [X] Provide an endpoint to list all saved recipes in JSON format _(We're not sure why grandma needs this one, but let's not question her)_

Because this is a prototype for Grandma we don't need to be concerned with using a real database (it's ok if we lose data when the app shuts down) and she isn't very picky about how the app looks.

# Solution approach
The problem was solved using a rails app. This application has 2 models: Recipes and Ingredients. Why ingredients? Because every recipe has a lot of ingredients and we don't want grandma furious.
The frontend part was built using bootstrap framework. A basic layout was created with the view for creation, edition and listing. Delete action was added too.
The application uses PostgreSQL as a DB Engine and you can connect your PostgreSQL server using the credentials (check config/database.yml).
The Recipe model has name and the recipe method itself and the Ingredient model has only name. These fields are mandatory for each model.
A join table was created to establish the many to many relationship between Recipes and Ingredients.

### Considerations

- How should the data be structured?
    The data was structured using 2 models: Recipes and Ingredients. A many to many relationship was created between them to solved the problem.
    The nullability of some model's fields were disable to avoid inconsistency in the DB  
- How would you actually store data in the app?
    The data is stored in a PostgreSQL Database with 3 main tables. One for Recipes, one for Ingredients and a last one to sotre the relationship between them.
- How would you deploy the app?
    The application was dockerized and docker-compose support was added. 
    In order to deploy the application you can use 2 ways:
        * Install all the dependencies and configuring everything in a server.
        * Using the docker image
    My recommendation is the second option, this way you can take advantage of diverse tools which use orchestration system like Kubernetes, Docker Swarm or Cattle.
    [Rancher Server](https://rancher.com) is a great tool to deploy this app. you just need to build the docker image and create a container on rancher using the image built by this repository
- What are you missing / what would you improve?
    An improvement could be split the application in backend component and frontend component.
    Backend component could be an RESTFUL API or GraphQL API with similar logic.
    Frontend component could be a Single Page Application which consumes the API and render the information for grandma.
    Tags could be added to recipes, this way it will be easier fro grandma to find a recipe and also create a search endpoint to be consumed by the frontend app.
    

### Installation and usage
#### Stand alone
* Install [PostgreSQL](https://www.postgresql.org/)
* Install [RVM](http://rvm.io/)
* install ruby 2.5.1
```bash
rvm install 2.5.1
```
* Install bundler gem
```bash
gem install bundler
```
* Install all the project's dependencies using bundler
```bash
bundle install
```
* Create and migrate the database
```bash
rake db:create
rake db:migrate
```
* (Optional) you can seed your database to have some preview information.
```bash
rake db:seed
```
* Run the server and visit the app in [https://localhost:3000](https://localhost:3000)

#### Using Docker and Docker Compose
* You just need to run the docker compose command and you're set
```bash
sudo docker-compose up
```
* Visit the application in [http://localhost:3001](http://localhost:3001). The previous command will create, migrate and seed the DB for you.



### Test Suite
I order to run the test suite you need to have ruby installed. You can run the test suite from a docker container is you want to.
To run the test suite only few command are needed:
* We need to create and migrate the DB for our test suite
```bash
rake db:create RAILS_ENV=test
rake db:migrate RAILS_ENV=test
```
* And we can run the test suite using:
```bash
rspec
```

    

