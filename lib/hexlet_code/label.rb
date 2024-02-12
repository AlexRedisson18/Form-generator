# frozen_string_literal: true

module HexletCode
  class Label
    def initialize(attribute)
      @attribute = attribute
    end

    def as_html_tag
      Tag.build('label', for: @attribute) { @attribute.capitalize }
    end
  end
end
