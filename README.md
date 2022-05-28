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

$ rails generate model order user:references total:decimal order_type:string restaurant_name:string img:string status:string


$ rails generate controller orders

$ rails generate model orderPartispant user:references order:references

$  rails generate migration add_status_to_order_partispants status:string

$  rails generate migration create_items name:string amount:number price:number comment:text