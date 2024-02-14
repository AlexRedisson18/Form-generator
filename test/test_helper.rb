# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'

def expected_result(file_name)
  File.read("test/fixtures/#{file_name}.html").gsub("\n", '')
end
