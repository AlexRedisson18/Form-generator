# frozen_string_literal: true

require_relative 'hexlet_code/version'
require 'active_support/core_ext/string/inflections'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :FormGenerator, 'hexlet_code/form_generator'
  autoload :FormBuilder, 'hexlet_code/form_builder'

  def self.form_for(model, options = {})
    form = FormGenerator.new(model, options)
    yield(form) if block_given?

    FormBuilder.new(form).build_html
  end
end
