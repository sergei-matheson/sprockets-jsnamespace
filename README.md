# Sprockets::Jsnamespace

Adds support for simple javascript namespacing to sprockets

## Installation

Add this line to your application's Gemfile:

    gem 'sprockets-jsnamespace'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sprockets-jsnamespace

## Usage

Adds support for a new sprockets directive: jsnamespace
This will declare any needed namespaces, without declaring over anything.
When serving assets in development mode, just adds a simple javascript function.
When precompiling assets, declares all needed namespaces for a bundle at the top.
eg. 
```javascript
//= require other_file
//= jsnamespace Woot.Things
Woot.Things.Stuff.Me = Backbone.Model.extend({
  
});
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
