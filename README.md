# RailsAdminMarkitup

Extend rails_admin text fields with markitup-rails. Instead of lumping this all in to the rails_admin gem, or maintaining a fork, I've opted to make a small change to rails_admin which makes it easy for me extend it via this gem.

**NOTE:** Currently dependent on a forked branch of rails_admin (Waiting on pull request acceptance) https://github.com/robertjwhitney/rails_admin/tree/adds_plugins_js_for_extending

TODO:

- Make custom configuration of markitup js accessible outside of gem source.
- Don't autoload redcarpet if another rendering engine is desired.
- Tests


## Installation

Add this line to your application's Gemfile:

    gem 'rails_admin_markitup'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_admin_markitup

## Usage

Include the plugin javascript by overriding the plugins.js manifest file at rails_admin/plugins.js

```javascript
//= require 'rails_admin_markitup/rails_admin_markitup'
```

Apply the custom type to any field you want in your rails_admin initializer:

```ruby
config.model 'Story' do
  edit do
    field :title
    field :body, :markitup
  end
end
```

Use the built-in markdown helper to render it (via redcarpet)

```ruby
<%= parse_markdown("YOUR MARKDOWN CONTENT HERE") %>
```

Or define you own.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
