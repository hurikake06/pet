# frozen_string_literal: true

module ViewHelper
  def print_form_error(errors, key)
    if errors.present? && errors[key].present?
      str = ''
      errors[key].each do |error|
        str += "#{error},"
      end
      str
    end
  end

  def user_mode_class
    @temp_mode ||= login_flag ? session[:user_mode] : 'NULL'
  end
end
