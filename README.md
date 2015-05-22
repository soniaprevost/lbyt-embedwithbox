# Box View Rails

This is a clean repository from which you can train yourself to implement Box View.

## Learning by Teaching

Learningbyteaching is a series of workshops from [Le Wagon](http://lewagon.org/)'s alumni.

Don't miss the next workshop on http://www.meetup.com/Le-Wagon-Paris-Coding-Station/

## Implementation

Workshop slides are available here: http://slides.com/soniaprevost/boxviewrails/

You can also see the solution by [comparing master and boxview branches](https://github.com/soniaprevost/lbyt-embedwithbox/compare/master...boxview).

## Requirements

* ruby 2.2.0
* bundler
* PostgreSQL

## Improvements

* Do not generate the box_viewer in the view
* Extract Box View methods from model to a lib
* Manage when Box View is not available
* Make it asynchronous using delayed_job, sidekiq or resque