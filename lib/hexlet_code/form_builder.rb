# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def initialize(form)
      @form = form
    end

    def build_html
      Tag.build('form', form_options) { html_nested_tags }
    end

    private

    def html_nested_tags
      collection = @form.nested_tags
      collection << @form.submit_tag if @form.submit_tag
      collection.map(&:as_html_tag).join
    end

    def form_options
      action = @form.form_options.fetch(:url, '#')
      method = @form.form_options.fetch(:method, 'post')

      @form.form_options.except(:url).merge(action:, method:).sort.to_h
    end
  end
end
