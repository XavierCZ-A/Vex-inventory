# frozen_string_literal: true

class FileUploadComponent < ViewComponent::Base
  attr_reader :url, :label_text, :input_name, :accept_types, :icon, :submit_text

  def initialize(url:, label_text:, input_name: :file, accept_types: ".csv", icon: "upload", submit_text: "Subir")
    @url = url
    @label_text = label_text
    @input_name = input_name
    @accept_types = accept_types
    @icon = icon
    @submit_text = submit_text
  end

  def stimulus_controller
    "file-upload"
  end

  def input_data_attributes
    {
      "#{stimulus_controller}_target" => "input",
      "action" => "change->#{stimulus_controller}#toggleButton"
    }
  end

  def submit_data_attributes
    {
      "#{stimulus_controller}_target" => "submit"
    }
  end
end
