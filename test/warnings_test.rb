load File.join(File.dirname(__FILE__), 'test_helper.rb')

class WarningsTest < MiniTest::Unit::TestCase

  class TestMe < Struct.new(:one, :two, :three)
    include ActiveModel::Validations
    include ActiveModel::Warnings
    validates_presence_of :one
    validates_presence_of :two, :warning => true
    warnings do
      validates_presence_of :three
    end
  end

  def setup
    @valid   = TestMe.new("one", "two", "three")
    @invalid = TestMe.new()
  end

  def test_without_skipping
    @valid.errors.expects(:add).never
    @valid.valid?

    @invalid.errors.expects(:add).with(:one, :blank, anything)
    @invalid.errors.expects(:add).with(:two, :blank, anything)
    @invalid.errors.expects(:add).with(:three, :blank, anything)
    @invalid.valid?
  end

  def test_with_skipping
    @valid.skip_warnings = true
    @valid.errors.expects(:add).never
    @valid.valid?

    @invalid.skip_warnings = true
    @invalid.errors.expects(:add).with(:one, :blank, anything)
    @invalid.valid?
  end

  def test_validator_recives_the_warning_option
    assert ! TestMe.validators_on(:one).first.options[:warning]
    assert TestMe.validators_on(:two).first.options[:warning]
    assert TestMe.validators_on(:three).first.options[:warning]
  end

end
