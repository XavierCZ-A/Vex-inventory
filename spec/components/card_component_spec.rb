# frozen_string_literal: true

require "rails_helper"

RSpec.describe Shared::CardComponent, type: :component do
  let(:title) { "Ventas Totales" }
  let(:value) { 12345.67 }
  let(:icon) { "cash" }
  let(:component) { described_class.new(title: title, value: value, icon: icon) }

  it "renders basic card with default color and no formatting" do
    render_inline(component)

    expect(page).to have_css("article.bg-white.p-4")
    expect(page).to have_css("h2", text: title)
    expect(page).to have_css("p", text: value.to_s)
    expect(page).to have_css("span.bg-blue-100.text-blue-500")
  end

  context "when specifying colors" do
    it "renders with green color classes" do
      render_inline(described_class.new(title: title, value: value, icon: icon, color: "green"))
      expect(page).to have_css("span.bg-green-100.text-green-500")
    end

    it "renders without specific color classes for invalid color" do
      render_inline(described_class.new(title: title, value: value, icon: icon, color: "invalid"))
      expect(page).to have_css("span")
      expect(page).to have_css("span:not([class*='bg-blue']):not([class*='bg-green']):not([class*='text-blue']):not([class*='text-green'])")
    end
  end

  context "when formatting values" do
    it "formats value as currency" do
      component = described_class.new(title: title, value: value, icon: icon, formatter: :currency)
      render_inline(component)
      expect(page).to have_css("p", text: component.formatted_value)
    end

    it "formats value with delimiter" do
      large_value = 1234567
      component = described_class.new(title: title, value: large_value, icon: icon, formatter: :delimiter)
      render_inline(component)
      expect(page).to have_css("p", text: component.formatted_value)
    end

    it "formats value as percentage" do
      percentage_value = 98.76
      component = described_class.new(title: title, value: percentage_value, icon: icon, formatter: :percentage)
      render_inline(component)
      expect(page).to have_css("p", text: component.formatted_value)
    end

    it "renders raw value for unknown formatter" do
       render_inline(described_class.new(title: title, value: value, icon: icon, formatter: :unknown))
       expect(page).to have_css("p", text: value.to_s)
     end
  end
end
