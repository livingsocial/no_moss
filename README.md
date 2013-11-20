# no\_moss

Provides a means of defining object role APIs that should be consistent
between test subjects (objects under test) and test doubles (AKA mock
objects).

A role provides data that can be used to verify that a test subject
implements the role API. A role also provides a wrapper around a
test double that prevents unsupported interactions.

## Installation

Add this line to your application's Gemfile:

    gem "no_moss"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install no_moss

## Usage

### Basic

Define a Role API using the NoMoss.define\_role method as follows:

    PersonRole = NoMoss.define_role do
      implements :id, :name, :email
    end

Identify any of a role API's methods not implemented by an object
(usually for unit testing purposes) using the role's
unimplemented\_methods\_of method as follows:

    PersonRole.unimplemented_methods_of(object)

Define a Role-restricted proxy to a test subject (object under
test) or a test double (AKA mock object) as follows:

    PersonRole.restrict(test_double)

### Test::Unit

Enable no\_moss rspec matchers by adding the following to your
test helper file:

    require 'no_moss/test/unit/assertions'

To verify that an object under test implements a role API...

    def test_acts_like_a_person
      assert_plays_role RoleAPIs::Person, @someobject
    end

### Rspec

Enable no\_moss rspec matchers by adding the following to your
spec\_helper file:

    require 'no_moss/rspec/matchers'

... or for no\_moss rspec matchers and shared examples, ...

    require 'no_moss/rspec/all'

To verify that an object under test implements a role API...

    it "acts like a person" do
      expect( someobject ).to play_role( RoleAPIs::Person )
    end

To use a shared example to verify that the current subject implements
a role API...

    subject{ Fruit }
    include_examples "plays the role of", RoleAPIs::FruitRepository

To enforce the role API for an object under test...

    subject{ FruitRepository.restrict(Fruit) }

To enforce the role API for a test double (AKA mock object) being used
as a dependency...

    let(:fruit_repository){ double(:fruit_repository) }
    subject{ Farm.new(
      :fruit_repository => RoleAPIs::FruitRepository.restrict(fruit_repository)
    ) }

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
