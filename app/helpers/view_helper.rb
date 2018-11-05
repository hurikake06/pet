module ViewHelper
  def print_form_error (errors, key)
    if errors.present? && errors[key].present?
      str = ""
      errors[key].each do |error|
        str += "#{error},"
      end
      return str
    end
  end
end
