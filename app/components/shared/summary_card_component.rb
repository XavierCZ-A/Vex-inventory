# frozen_string_literal: true

class Shared::SummaryCardComponent < ViewComponent::Base
  renders_many :cards, Shared::CardComponent

  def initialize(title:)
    @title = title
  end
end
