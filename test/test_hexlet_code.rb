# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def setup
    @user = User.new(name: 'John', job: 'driver')
  end

  def test_that_it_has_a_version_number
    assert_equal ::HexletCode::VERSION, '0.1.0'
  end

  def test_form_for_return_empty_form
    result = HexletCode.form_for @user
    expected_result = "<form action='#' method='post'></form>"

    assert_equal(result, expected_result)
  end

  def test_form_for_return_form_with_input_and_submit_and_default_url_method
    result = HexletCode.form_for @user do |f|
      f.input :name
      f.submit
    end
    expected_result = "<form action='#' method='post'>" \
                      "<label for='name'>Name</label>" \
                      "<input name='name' type='text' value='John'>" \
                      "<input type='submit' value='Save'>" \
                      '</form>'

    assert_equal(result, expected_result)
  end

  def test_form_for_return_form_with_attributes
    result = HexletCode.form_for @user, url: '/users', method: 'delete' do |f|
      f.input :name
      f.submit
    end
    expected_result = "<form action='/users' method='delete'>" \
                      "<label for='name'>Name</label>" \
                      "<input name='name' type='text' value='John'>" \
                      "<input type='submit' value='Save'>" \
                      '</form>'

    assert_equal(result, expected_result)
  end

  def test_form_for_return_form_with_textarea
    result = HexletCode.form_for @user do |f|
      f.input :name, as: :text
      f.submit
    end
    expected_result = "<form action='#' method='post'>" \
                      "<label for='name'>Name</label>" \
                      "<textarea name='name' cols='20' rows='40'>John</textarea>" \
                      "<input type='submit' value='Save'>" \
                      '</form>'

    assert_equal(result, expected_result)
  end

  def test_form_for_return_form_renamed_submit
    result = HexletCode.form_for @user do |f|
      f.input :name
      f.submit 'SUBMIT'
    end
    expected_result = "<form action='#' method='post'>" \
                      "<label for='name'>Name</label>" \
                      "<input name='name' type='text' value='John'>" \
                      "<input type='submit' value='SUBMIT'>" \
                      '</form>'

    assert_equal(result, expected_result)
  end
end
