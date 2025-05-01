# frozen_string_literal: true

class Shared::NavigationComponent < ViewComponent::Base
  renders_many :buttons, Ui::ButtonComponent

  attr_reader :title, :subtitle

  def initialize(title:, subtitle:)
    @title = title
    @subtitle = subtitle
  end
end
