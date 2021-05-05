# frozen_string_literal: true

require 'test/unit'
require './lib/lns_generator'

class TestLNSGenerator < Test::Unit::TestCase
  # constructor spec
  def test_init_with_no_argument
    assert_raise(ArgumentError) { LNSGenerator.new }
  end

  def test_init_with_non_string
    assert_raise(ArgumentError) { LNSGenerator.new(1) }
  end

  def test_init_with_alphanumeric_string
    assert_raise(ArgumentError) { LNSGenerator.new('123a') }
  end

  def test_init_with_string
    assert_nothing_raised { LNSGenerator.new('23') }
  end

  # next method spec
  def test_next_returns_string
    assert_instance_of(String, LNSGenerator.new('23').next, 'Should return string')
  end

  def test_next_returns_correct_string
    assert_equal('1213', LNSGenerator.new('23').next)
    assert_equal('22', LNSGenerator.new('22').next)
    assert_equal('1114111311', LNSGenerator.new('14131').next)
    assert_equal('1321121321', LNSGenerator.new('3112311').next)
    assert_equal('3123', LNSGenerator.new('11133').next)
  end

  # take method specs
  def test_take_requires_argument
    assert_raise(ArgumentError) { LNSGenerator.new('23').take }
  end

  def test_take_returns_array
    count = 3

    result = LNSGenerator.new('23').take(count)
    assert_instance_of(Array, result, 'Should return array')
  end

  def test_take_returns_array_with_specified_qty
    count = 3

    result = LNSGenerator.new('23').take(count)
    assert_equal(count, result.length, "Should return #{count} items")
  end

  def test_take_returns_array_with_sequential_strings
    expected = %w[1 11 21 1211 111221 312211]
    result = LNSGenerator.new('1').take(expected.size)

    assert_equal(expected, result)
  end
end
