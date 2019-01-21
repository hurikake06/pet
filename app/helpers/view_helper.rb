# frozen_string_literal: true

module ViewHelper
  require 'uri'

  def print_form_error(errors, key)
    if errors.present? && errors[key].present?
      str = ''
      errors[key].each do |error|
        str += "#{error},"
      end
      str
    end
  end

  def text_url_to_link(text)
    URI.extract(text, %w[http https]).uniq.each do |url|
      sub_text = ''
      sub_text << '<a href=' << url << ' target="_blank">' << url << '</a>'
      text.gsub!(url, sub_text)
    end
    text
  end
end
