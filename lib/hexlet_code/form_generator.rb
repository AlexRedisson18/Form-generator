# frozen_string_literal: true

require 'hexlet_code/tags/label'
require 'hexlet_code/tags/input'
require 'hexlet_code/tags/text'
require 'hexlet_code/tags/submit'

module HexletCode
  class FormGenerator
    attr_reader :form_options, :nested_tags, :submit_tag

    def initialize(model, form_options)
      @model = model
      @form_options = form_options
      @nested_tags = []
      @submit_tag = nil
    end

    def input(attribute, options = {})
      value = @model.public_send(attribute)
      add_tag('label', attribute)

      input_type = options[:as] || 'input'
      add_tag(input_type, attribute, value, options)
    end

    def submit(value = 'Save')
      @submit_tag = HexletCode::Tags::Submit.new(value)
    end

    def add_tag(input_type, attribute = '', value = '', options = {})
      class_name = Object.const_get("HexletCode::Tags::#{input_type.capitalize}")
      @nested_tags << class_name.new(attribute, value, **options)
    end
  end
end
