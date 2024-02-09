# frozen_string_literal: true

module HexletCode
  class Tag
    class << self
      def build(tag, options = {})
        attributes = options.reduce([]) { |acc, (key, value)| acc << "#{key}='#{value}'" }.unshift('').join(' ')
        tail_tag = single_tag?(tag) ? nil : "</#{tag}>"
        body = yield if block_given? && tail_tag

        "<#{tag}#{attributes}>#{body}#{tail_tag}"
      end

      private

      def single_tag?(tag)
        %w[br hr img input].include?(tag.downcase)
      end
    end
  end
end
