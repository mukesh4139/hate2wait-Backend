== README

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


## Documentation

For Serializers, active_model_serializers has been used.

For Pagination, kaminari gem is used for pagination.

For Testing, rspec has been used

            $ rspec spec/controllers/
            $ rspec spec/models/

## Assumptions



