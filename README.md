# no_moss

Provides a means of defining object role APIs that should be consistent
between test subjects (objects under test) and test doubles (AKA mock
objects).

A role provides data that can be used to verify that a test subject
implements the role API. A role also provides a wrapper around a
test double that prevents unsupported interactions.

## Installation

Add this line to your application's Gemfile:

    gem "no_moss", '~> 0.5.0', :git => 'git@github.com:livingsocial/no_moss.git', :tag => 'v0.5.0'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install no_moss

## Usage

Define a Role API using the NoMoss.define_role method as follows:

    PersonRole = NoMoss.define_role do
      implements :id, :name, :email
    end

Identify any of a role API's methods not implemented by an object
(usually for unit testing purposes) using the role's
unimplemented_methods_of method as follows:

    PersonRole.unimplemented_methods_of(object)

Define a Role-restricted proxy to a test subject (object under
test) or a test double (AKA mock object) as follows:

    PersonRole.restrict(test_double)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
