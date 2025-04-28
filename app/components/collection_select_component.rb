# frozen_string_literal: true

class CollectionSelectComponent < ViewComponent::Base
  attr_reader :form, :attribute, :collection, :value_method, :text_method, :prompt, :icon, :object

  def initialize(form:, attribute:, collection:,
                 value_method: :id,
                 text_method: :name,
                 prompt: nil,
                 icon: nil)
    @form = form
    @attribute = attribute
    @collection = collection
    @value_method = value_method
    @text_method = text_method
    @prompt = prompt
    @icon = icon
    @object = form.object
  end

  def has_errors?
    object.errors[attribute].any?
  end

  def collection_select_classes
    base_classes = "block w-full pl-10 pr-3 py-2 border border-gray-300 rounded-md focus:ring-indigo-500 focus:border-indigo-500"

    error_classes = "border-red-400 focus:outline-red-600"
    no_error_classes = "border-gray-300 focus:outline-blue-600"

    "#{base_classes} #{has_errors? ? error_classes : no_error_classes}"
  end

  def html_options
    {
      class: collection_select_classes,
      prompt: prompt
    }
  end
end
