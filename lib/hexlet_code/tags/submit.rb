# frozen_string_literal: true

module HexletCode
  module Tags
    class Submit
      def initialize(value = 'Save')
        @value = value
      end

      def as_html_tag
        Tag.build('input', type: 'submit', value: @value)
      end
    end
  end
end
