# frozen_string_literal: true

module HexletCode
  module Tags
    class Label
      def initialize(attribute, _value = '', _options = {})
        @attribute = attribute
      end

      def as_html_tag
        Tag.build('label', for: @attribute) { @attribute.capitalize }
      end
    end
  end
end
