# frozen_string_literal: true

class Ui::InputComponent < ViewComponent::Base
  attr_reader :form, :attribute, :icon, :placeholder, :type, :object

  def initialize(form:, attribute:, icon:, placeholder:, type: :text)
    @form = form
    @attribute = attribute
    @icon = icon
    @placeholder = placeholder
    @type = type # Tipo de input (text, email, password, etc.)
    @object = form.object
  end

  def has_errors?
    object.errors[attribute].any?
  end

  def input_classes
    base_classes = "block w-full pl-10 pr-3 py-2 border rounded-md focus:ring-indigo-500 focus:border-indigo-500"

    error_classes = "border-red-400 focus:outline-red-600"
    no_error_classes = "border-gray-300 focus:outline-blue-600" # Corregí el borde base a gray-300 según tu ejemplo original

    "#{base_classes} #{has_errors? ? error_classes : no_error_classes}"
  end

  def icon_classes
    "text-primary"
  end

  def input_options
    {
      placeholder: placeholder,
      class: input_classes
    }
  end
end
