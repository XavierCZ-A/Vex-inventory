# frozen_string_literal: true

class Ui::ButtonComponent < ViewComponent::Base
  attr_reader :path, :text, :icon, :turbo_frame

  def initialize(path:, text:, icon:, turbo_frame: nil)
    @path = path
    @text = text
    @icon = icon
    @turbo_frame = turbo_frame
  end

  def button_classes
    "principal-button"
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
