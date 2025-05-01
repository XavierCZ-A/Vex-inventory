# frozen_string_literal: true

require "rails_helper"

RSpec.describe Ui::ButtonComponent, type: :component do
  it "renders the primary variant by default" do
    render_inline(described_class.new(path: "/test", text: "Click Me", icon: "plus"))

    expect(page).to have_link("Click Me", href: "/test")
    expect(page).to have_css("a.principal-button")
    expect(page).not_to have_css("a[data-turbo-frame]")
  end

  it "renders the secondary variant when specified" do
    render_inline(described_class.new(path: "#", text: "More Info", icon: "info-circle", variant: :secondary))

    expect(page).to have_link("More Info", href: "#")
    expect(page).to have_css("a.button")
    expect(page).not_to have_css("a.principal-button")
  end

  it "renders without an icon if icon is nil" do
    render_inline(described_class.new(path: "/go", text: "Go", icon: nil))

    expect(page).to have_link("Go", href: "/go")
    expect(page).to have_css("a.principal-button")
    expect(page).not_to have_css("svg")
  end

  it "includes data-turbo-frame when provided" do
    render_inline(described_class.new(path: "/load", text: "Load", icon: "refresh", turbo_frame: "content"))

    expect(page).to have_link("Load", href: "/load")
    expect(page).to have_css('a[data-turbo-frame="content"]')
  end

  it "defaults to primary variant for invalid variant input" do
     render_inline(described_class.new(path: "/test", text: "Click Me", icon: "plus", variant: :invalid_variant))

    expect(page).to have_link("Click Me", href: "/test")
    expect(page).to have_css("a.principal-button")
  end
end
