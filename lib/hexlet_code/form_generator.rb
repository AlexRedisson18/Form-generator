# frozen_string_literal: true

module HexletCode
  class FormGenerator
    def initialize(model, form_options)
      @model = model
      @form_options = form_options
      @nested_tags = []
      @submit_tag = ''
    end

    def build
      prepare_form_options
      Tag.build('form', @form_options) { (@nested_tags << @submit_tag).join }
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
      @nested_tags << Tag.build('label', for: attribute) { attribute.capitalize }
    end

    def add_input(attribute, value, options)
      @nested_tags << Tag.build('input', name: attribute, type: 'text', value: value, **options)
    end

    def add_textarea(attribute, value, options)
      options[:cols] ||= 20
      options[:rows] ||= 40
      @nested_tags << Tag.build('textarea', name: attribute, **options.except(:as)) { value }
    end

    def submit(value = 'save')
      @submit_tag = Tag.build('input', type: 'submit', value: value)
    end

    def prepare_form_options
      @form_options[:action] = @form_options.delete(:url) || '#'
      @form_options[:method] ||= 'post'
      @form_options = @form_options.sort.to_h
    end
  end
end
