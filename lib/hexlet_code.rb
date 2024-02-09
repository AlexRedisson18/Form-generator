# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :FormGenerator, 'hexlet_code/form_generator'

  def self.form_for(model, options = {})
    form = FormGenerator.new(model, options)
    yield(form) if block_given?
    form.build
  end
end
