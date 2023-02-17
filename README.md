# Yonda

A reddit clone where you can log in as a user, create and upvote/downvote thread and comment on threads. Using Rails for the Web server, Docker for containerization, Github actions for Continuous Integration and deployed to Heroku.      

## Getting Started

After forking this repo to your device go to its root path and run 
```
bundle install
```
in the terminal to install all of its dependencies.

And then you can run

```
rails db:seed 
```
to fill the database with fake threads then run

```
rails s
```
to run it in your local server

## Deployment

You can deploy your own web application easily using heroku.

## Built With

* [Ruby on Rails](https://rubyonrails.org/) - The web framework used
* [Yarn](https://yarnpkg.com/) - Dependency Management
* [Heroku](https://www.heroku.com/what) - The cloud service used
