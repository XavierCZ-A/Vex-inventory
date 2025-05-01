# frozen_string_literal: true

class Ui::TextAreaComponent < ViewComponent::Base
  attr_reader :form, :attribute, :placeholder, :rows

  def initialize(form:, attribute:, placeholder:, rows: 4)
    @form = form
    @attribute = attribute
    @placeholder = placeholder
    @rows = rows
  end

  def text_area_classes
    "block shadow rounded-md border outline-none px-3 py-2 mt-2 w-full focus:ring-indigo-500 focus:border-indigo-500 border-gray-400 focus:outline-blue-600"
  end

  def text_area_options
    {
      placeholder: placeholder,
      rows: rows,
      class: text_area_classes
    }
  end
end
