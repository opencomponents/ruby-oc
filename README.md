# opencomponents
[![Build Status](https://travis-ci.org/opentable/ruby-oc.svg?branch=master)](https://travis-ci.org/opentable/ruby-oc)

[OpenComponents][1] for Ruby

[1]:https://github.com/opentable/oc

## Important
This gem is still under heavy development and the API is likely to change at any time.

## Getting Started
Add the gem to your Gemfile and run `bundle install` (prerelease versions aren't on RubyGems):
```ruby
gem 'opencomponents', github: 'opentable/ruby-oc'
```

By default, the gem will attempt to use a component registry located at `http://localhost:3030`.
If you want to use a different registry, you can configure OpenComponents to use it with:
```ruby
OpenComponents.configure { |config| config.registry = 'http://some.other.host' }
```

If you're using Rails, a convenient config option is provided for you to use in your configuration files:
```ruby
# config/environments/production.rb
config.opencomponents.registry = 'http://some.other.host'
```

## Rendering Components
OpenComponents includes view helper methods for Sinatra and Rails - in views for either framework, simply call:
```erb
# app/views/some_controller/some_action.html.erb
<%= render_component('my-component', {component_param: 'some value'}, '1.0.0') %>
```
The first argument is the name of the component, the second argument is a hash of any params to render with
the component, and the third argument is the version of the component you want to request. If there are no params
or desired version, you can omit these values.

## Contributing
Would be rad. Open a PR or Issue if you have an idea for improvements.

## License
Copyright 2015 OpenTable. See LICENSE for details.
