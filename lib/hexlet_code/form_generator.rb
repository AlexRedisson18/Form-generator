# frozen_string_literal: true

module HexletCode
  class FormGenerator
    class << self
      def build(_user, options = {})
        options[:action] = options[:url] || '#'
        options.delete(:url)
        options[:method] = 'post'

        Tag.build('form', options)
      end
    end
  end
end
