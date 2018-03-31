# hate2wait-Backend

This is a rails backend system with two models - Client and Token. Each Client in the backend can request as many tokens.

## Dependencies
            * Ruby Version    : 2.1.2
            * Rails           : 4.2.6
            * faker
            * active_model_serializer
            * kaminari
            * rspec

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

Adding .json to the URL will return json formatted response

#### Request a token

URL:                127.0.0.1:3000/tokens/request_token

Method:             GET

Compulsory Params:  client_id, token_type

Optional Params:    message 

#### Request a list of tokens

URL:                127.0.0.1:3000/tokens

Method:             GET

Optional Params:    page, token_type, message (to filter by message)

#### Clear the queue

URL:                127.0.0.1:3000/tokens/clear_queue

Method:             GET

## Assumptions

Once token hit A999, the next token generated will be A001, A002, and so on.

Once a token is cleared from the queue, we changed the served value of the token to true, by default it is false.
