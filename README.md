# Blimp
[![Gem Version](https://badge.fury.io/rb/blimp.png)](http://badge.fury.io/rb/blimp)
[![Dependency Status](https://gemnasium.com/jonahoffline/blimp.png)](https://gemnasium.com/jonahoffline/blimp)
[![Code Climate](https://codeclimate.com/github/jonahoffline/blimp.png)](https://codeclimate.com/github/jonahoffline/blimp)
[![Gitter chat](https://badges.gitter.im/jonahoffline/blimp.png)](https://gitter.im/jonahoffline/blimp)

Ruby gem that implements [Blimp's](http://www.getblimp.com/) public API.

## Installation

Add this line to your application's Gemfile:

    gem 'blimp'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install blimp


## Usage

Use the following template for your API credentials. If you don't have them already, you can get them [here](https://app.getblimp.com/user/settings/api/).

```ruby
Blimp.api_key = "API_KEY"
Blimp.app_id = "APP_ID"
Blimp.app_secret = "APP_SECRET"
Blimp.username = "USERNAME"
```

This gem implements Company, Project, Goal, Task, Comment, File, and User resources. There are two main methods for finding resources, first there is the `find` method that finds a single instance of a resource by its id. There is also a `find_all` method that returns an array of all of that resource.


```ruby
project = Blimp::Project.find(1)  # Finds a project with an id of 1
Blimp::Company.find_all # Finds all of the companies you have access to 

project.name = "New Project Name" # Set the name of the project
project.save # Attempts to save the project's changes
```

## Todo

* Start testing the gem with Minitest
* Handle required fields when creating new resources
* Have better error coverage

## Discussion
If you have any questions, ideas or jokes:

[![Gitter chat](https://badges.gitter.im/jonahoffline/blimp.png)](https://gitter.im/jonahoffline/blimp)

## Contributing

1. Fork it
3. Commit your changes 
4. Push to the your fork
5. Create new Pull Request
