# frozen_string_literal: true

require "rails_helper"

RSpec.describe Ui::TextAreaComponent, type: :component do
  let(:form) { instance_double(ActionView::Helpers::FormBuilder, object_name: 'dummy') }
  let(:basic_textarea_html) { '<textarea></textarea>' }

  it "renders a text area" do
    allow(form).to receive(:textarea).with(any_args).and_return(basic_textarea_html.html_safe)

    render_inline(described_class.new(form: form, attribute: :description, placeholder: "Enter your description"))

    expect(page).to have_css("textarea", visible: :all)
  end

  it "renders a text area with a placeholder" do
    expect(form).to receive(:textarea).with(
      :description,
      hash_including(
        placeholder: "Enter your description",
        rows: 4,
        class: kind_of(String)
      )
    ).and_return('<textarea placeholder="Enter your description"></textarea>')

    render_inline(described_class.new(form: form, attribute: :description, placeholder: "Enter your description"))
  end
end
