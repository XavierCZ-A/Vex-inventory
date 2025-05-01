# frozen_string_literal: true

require "rails_helper"

RSpec.describe Ui::InputComponent, type: :component do
  it "renders an input field" do
    render_inline(described_class.new(form: form, attribute: :name, icon: "user", placeholder: "Enter your name"))

    expect(page).to have_css("input[type='text']")
  end
end
