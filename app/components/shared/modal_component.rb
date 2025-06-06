# frozen_string_literal: true

class Shared::ModalComponent < ViewComponent::Base
  attr_reader :title, :subtitle

  def initialize(title:, subtitle:)
    @title = title
    @subtitle = subtitle
  end
end
