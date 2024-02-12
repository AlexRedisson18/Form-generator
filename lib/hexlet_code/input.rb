# frozen_string_literal: true

module HexletCode
  class Input
    def initialize(attribute, value, options = {})
      @attribute = attribute
      @value = value
      @options = options
    end

    def as_html_tag
      Tag.build('input', name: @attribute, type: 'text', value: @value, **@options)
    end
  end
end
