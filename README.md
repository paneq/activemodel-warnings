activemodel-warnings
====================

[![Build Status](https://secure.travis-ci.org/paneq/activemodel-warnings.png?branch=master&.png)](http://travis-ci.org/paneq/activemodel-warnings)
[![Dependency Status](https://gemnasium.com/paneq/activemodel-warnings.png)](https://gemnasium.com/paneq/activemodel-warnings)

Description
-----------

Mark some validations as optional using very simple syntax
and let them all be skipped by setting one attribute.

This is useful when you want to ensure that the user is sure
about given values and does not want to make any changes even
if some of them looks wrong to your app.

Works with active model and active record.

Installation
------------

In your `Gemfile` add:

```ruby
gem 'activemodel-warnings'
```

And run:

```
bundle install
```

Usage
-----

Add `warning: true` option to your validation:

```ruby
validates_presence_of :telephone, warning: true
```

Or define skippable validations in `warnings` block:

```ruby
warnings do
  validates_presence_of :address
end
```

Example
-------

```ruby
class OptionalData < Struct.new(:telephone, :address)
  include ActiveModel::Validations
  include ActiveModel::Warnings

  validates_presence_of :telephone, :warning => true
  warnings do
    validates_presence_of :address
  end
end

data = OptionalData.new()
data.valid? => false
data.skip_warnings = true
data.valid? => true
```


Workflow
----------------

1. User edits the form
2. User clicks `save` button
3. Optional validation does not pass
4. Form is rendered and displays warnings
5. User fixes/fills some values or clicks the checkbox "skip warnings"
6. Validations passes and object is saved
7. Win!


Using with forms
----------------

Overwrite `skip_warnings=` setter to properly parse values coming from Rails generated forms:

```ruby
class User < ActiveRecord::Base
  validates_presence_of :birthdate, warning: true

  def skip_warnings=(value)
    @skip_warnings = parse_boolean(value)
  end

  private

  def parse_boolean(b)
    return b if b.nil? || b == true || b == false
    case b
    when /^1$/, /^true$/i , /^yes$/i then true
    when /^0$/, /^false$/i , /^no$/i then false
    else
      raise ArgumentError, "Unknown conversion to boolean type from: #{b.class}, Inspect: #{b.inspect}"
    end
  end
end
```
