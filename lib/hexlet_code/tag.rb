module HexletCode
  class Tag
    class << self
      def build(tagname, attributes = {})
        tags = tags_hash(tagname)
        attributes_array = attributes.each_with_object([]) { |(key, value), acc| acc << "#{key}=\"#{value}\"" }
        attributes_array.unshift('') if attributes_array.any?
        head_tag_with_options = "<#{tags[:head]}#{attributes_array.join(' ')}>"
        body = yield if block_given?

        "#{head_tag_with_options}#{body}#{tags[:tail]}"
      end

      private

      def single_tags
        %w[br hr img]
      end

      def tags_hash(tagname)
        downcased_tag = tagname.to_s.downcase
        tail_tag = single_tags.include?(downcased_tag) ? '' : "</#{downcased_tag}>"

        { head: downcased_tag, tail: tail_tag }
      end
    end
  end
end
