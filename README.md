# api_spec
This project is centered around generating the `spec.json` file
located in the root directory. The `spec.json` file contains a machine
readable specification of the NationBuilder API. It is in Mashery's
[I/O Docs](http://www.mashery.com/product/io-docs) format. The
specification can be used to generate documentation servers and client
libraries for the NationBuilder API.

## Developer environment setup

```ruby
bundle install
```

## Adding/modifying an endpoint

Locate the file in `lib/api_spec/specs` that corresponds to the API
you're modifying. With the DSL used in the file, make your changes. In
the root project directory, run `rake` to update the `spec.json`
file. Commit your changes.