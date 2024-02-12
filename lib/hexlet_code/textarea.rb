# frozen_string_literal: true

module HexletCode
  class Textarea
    def initialize(attribute, value, options = {})
      @attribute = attribute
      @value = value
      @cols = options.fetch(:cols, 20)
      @rows = options.fetch(:rows, 40)
      @options = options.except(:as).merge(cols: @cols, rows: @rows)
    end

    def as_html_tag
      Tag.build('textarea', name: @attribute, **@options) { @value }
    end
  end
end
