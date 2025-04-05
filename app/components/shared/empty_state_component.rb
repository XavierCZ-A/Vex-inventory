# frozen_string_literal: true

class Shared::EmptyStateComponent < ViewComponent::Base
  attr_reader :title, :description, :icon, :path, :text, :icon_button, :turbo_frame

  def initialize(title:, description:, icon:, path:, text:, icon_button:, turbo_frame: nil)
    @title = title
    @description = description
    @icon = icon
    @path = path
    @text = text
    @icon_button = icon_button
    @turbo_frame = turbo_frame
  end

  def data_turbo_frame
    turbo_frame ? { turbo_frame: turbo_frame } : {}
  end
end
