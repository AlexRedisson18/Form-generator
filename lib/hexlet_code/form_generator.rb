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
      add_label(attribute)

      if options[:as].to_s == 'text'
        add_textarea(attribute, value, options)
      else
        add_input(attribute, value, options)
      end
    end

    def add_label(attribute)
      @nested_tags << Label.new(attribute)
    end

    def add_input(attribute, value, options)
      @nested_tags << Input.new(attribute, value, **options)
    end

    def add_textarea(attribute, value, options)
      @nested_tags << Textarea.new(attribute, value, **options)
    end

    def submit(value = 'Save')
      @submit_tag = Submit.new(value)
    end
  end
end
