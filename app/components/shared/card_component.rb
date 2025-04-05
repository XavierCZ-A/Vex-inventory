# frozen_string_literal: true

class Shared::CardComponent < ViewComponent::Base
  attr_reader :title, :value, :icon, :color, :formatter

  def initialize(title:, value:, icon:, color: "blue", formatter: nil)
    @title = title
    @value = value
    @icon = icon
    @color = color
    @formatter = formatter
  end

  def formatted_value
    return value unless formatter

    case formatter
    when :currency
      helpers.number_to_currency(value)
    when :delimiter
      helpers.number_with_delimiter(value)
    when :percentage
      helpers.number_to_percentage(value, precision: 1)
    else
      value
    end
  end

  def color_classes
    {
      "blue" => "bg-blue-100 text-blue-500",
      "green" => "bg-green-100 text-green-500",
      "red" => "bg-red-100 text-red-500",
      "yellow" => "bg-yellow-100 text-yellow-500",
      "purple" => "bg-purple-100 text-purple-500"
    }[color]
  end
end
