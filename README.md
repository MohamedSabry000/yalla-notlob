# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Commands
* rails new yalla-notlob

* bundle install

* rails db:prepare

* rails db:migrate

* in **Gemfile** => `gem 'devise'

* bundle install

* rails db:prepare

* rails db:migrate

* rails generate devise:install

* in **config/environments/development.rb:** => add 
```
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

* in your **config/routes.rb** => add `root 'pages#myaccount'`

* in **app/views/layouts/application.html.erb.** => add *_alert.ru* file containing
```
<div class="alert alert-warning alert-dismissible fade show" role="alert">
    <%= notice %>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
```

* rails g devise:views

* rails generate devise User

* rails db:prepare

* rails db:migrate

