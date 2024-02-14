# frozen_string_literal: true

module HexletCode
  autoload(:Label, 'hexlet_code/label.rb')
  autoload(:Input, 'hexlet_code/input.rb')
  autoload(:Textarea, 'hexlet_code/textarea.rb')
  autoload(:Submit, 'hexlet_code/submit.rb')

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
      input_tag_name = options[:as].to_s == 'text' ? 'textarea' : 'input'
      add_tag(input_tag_name, attribute, value, options)
    end

    def submit(value = 'Save')
      @submit_tag = Submit.new(value)
    end

    def add_tag(tagname, attribute = '', value = '', options = {})
      class_name = HexletCode.const_get(tagname.capitalize)
      @nested_tags << class_name.new(attribute, value, **options)
    end
  end
end
