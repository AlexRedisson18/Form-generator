# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def setup
    @user = User.new(name: 'John')
  end

  def test_that_it_has_a_version_number
    assert_equal ::HexletCode::VERSION, '0.1.0'
  end

  def test_should_return_correct_form_tag
    result = HexletCode.form_for @user
    expected_result = "<form action='#' method='post'></form>"

    assert_equal(result, expected_result)
  end

  def test_should_return_correct_form_tag_with_url
    result = HexletCode.form_for @user, url: '/users'
    expected_result = "<form action='/users' method='post'></form>"

    assert_equal(result, expected_result)
  end
end
