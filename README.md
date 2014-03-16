# OmniAuth Connexio
[![Code Climate](https://codeclimate.com/github/connexio-labs/omniauth-connexio.png)](https://codeclimate.com/github/connexio-labs/omniauth-connexio)
[![Build Status](https://travis-ci.org/connexio-labs/omniauth-connexio.png?branch=master)](https://travis-ci.org/connexio-labs/omniauth-connexio)
[![Coverage Status](https://coveralls.io/repos/connexio-labs/omniauth-connexio/badge.png)](https://coveralls.io/r/connexio-labs/omniauth-connexio)
[![Dependency Status](https://gemnasium.com/connexio-labs/omniauth-connexio.png)](https://gemnasium.com/connexio-labs/omniauth-connexio)
[![Gem Version](https://badge.fury.io/rb/omniauth-connexio.png)](http://badge.fury.io/rb/omniauth-connexio)

This is an OmniAuth strategy for authenticating to Connexio. To use it, you'll need to create an OAuth Client Application on Connexio's [Applications Page](login.connexiolabs.com/clients/new).

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-connexio'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-connexio

## Usage

In a Rails app, add the Tumblr provider to your Omniauth middleware, e.g. in a file like @config/initializers/omniauth.rb@:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :connexio, ENV['CONNEXIO_KEY'], ENV['CONNEXIO_SECRET']
end
```

In any Rack app you can add the Tumblr strategy like so:

```ruby
use OmniAuth::Builder do
  provider :connexio, ENV['CONNEXIO_KEY'], ENV['CONNEXIO_SECRET']
end
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/omniauth-connexio/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
