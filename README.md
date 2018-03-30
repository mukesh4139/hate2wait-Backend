# hate2wait-Backend

This is a rails backend system with two models - Item and Review. Item is any object which can be reviewed. Each item in the backend can have many reviews.

## Dependencies
            * Ruby Version    : 2.1.2
            * Rails           : 4.2.6
            * faker
            * active_model_serializer
            * kaminari
            * rspec
            * factory_girl_rails

## Installation
            $ git clone https://github.com/mukesh4139/hate2wait-Backend.git
            $ cd hate2wait-Backend
            $ bundle install
            $ rake db:migrate
            $ rake db:seed (optional)
            $ rails server
            
## Running Test
            $ rspec spec/controllers/
            $ rspec spec/models/


## Documentation

For Serializers, active_model_serializers has been used.

For Pagination, kaminari gem is used for pagination.

For Testing, rspec has been used

## APIS

#### Request a token

Url:                127.0.0.1:3000/tokens/request_token

Method:             GET

Compulsory Params:  client_id, token_type

Optional Params:    message

#### Request a list of tokens

Url:                127.0.0.1:3000/tokens

Method:             GET

Optional Params:    page, token_type

#### Clear the queue

Url:                127.0.0.1:3000/tokens/clear_queue

Method:             GET

