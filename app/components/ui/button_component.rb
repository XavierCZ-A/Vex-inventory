# frozen_string_literal: true

class Ui::ButtonComponent < ViewComponent::Base
  attr_reader :path, :text, :icon, :turbo_frame, :variant

  VARIANT_CLASSES = {
    primary:   %w[principal-button],
    secondary: %w[button],
    danger:    %w[button-danger]
  }.freeze

  def initialize(path:, text:, icon:, turbo_frame: nil, variant: :primary)
    @path = path
    @text = text
    @icon = icon
    @turbo_frame = turbo_frame
    @variant = VARIANT_CLASSES.key?(variant.to_sym) ? variant.to_sym : :primary
  end

  def variant_classes
    VARIANT_CLASSES.fetch(@variant, VARIANT_CLASSES[:primary]).join(" ")
  end

  def button_path
    path || "#"
  end

  def button_text
    text || "Button"
  end

  def button_icon
    icon || "plus"
  end

  def button_data_turbo_frame
    turbo_frame ? { turbo_frame: turbo_frame } : {}
  end
end
