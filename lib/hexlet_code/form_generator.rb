# frozen_string_literal: true

require 'hexlet_code/tags/label'
require 'hexlet_code/tags/input'
require 'hexlet_code/tags/textarea'
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

      tag_type = input_type(options.fetch(:as, 'input'))
      add_tag(tag_type, attribute, value, options)
    end

    def submit(value = 'Save')
      @submit_tag = HexletCode::Tags::Submit.new(value)
    end

    def add_tag(tagname, attribute = '', value = '', options = {})
      class_name = Object.const_get("HexletCode::Tags::#{tagname.capitalize}")
      @nested_tags << class_name.new(attribute, value, **options)
    end

    def input_type(type)
      case type.to_s
      when 'text'
        'textarea'
      else
        'input'
      end
    end
  end
end
