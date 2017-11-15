# OmniAuth Identitas

This gem contains the Identitas Oauth2 strategy for omniauth. 

Please read the documentations.

TODO: 
- Add more description 
- add documentation link

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-identitas'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-identitas

## Usage

Add Rack middleware in `config/initializers/omniauth.rb` :

```ruby

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identitas, "API_KEY", "API_SECRET"
end
```

If you are using [devise](https://github.com/plataformatec/devise) :

- Make sure you add [devise configuration for omniauth](https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview)
- Add strategy in `devise.rb`

```ruby
config.omniauth :identitas, "API_KEY", "API_SECRET",
  callback_url: "API_KEY"
```

If you are using staging version, add `ENV["IDENTITAS_SITE"] = 'http://api.identitas.extrainteger.com'` in your `boot.rb` just before `require 'bundler/setup'`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/extrainteger/omniauth-identitas. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Omniauth::Identitas project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/extrainteger/omniauth-identitas/blob/master/CODE_OF_CONDUCT.md).
