module ApplicationHelper
  include Pagy::Frontend
  def sidebar_link(text:, path:, icon_name:)
    is_active = current_page?(path)

    base_link_classes = "flex items-center space-x-3 text-base rounded-sm p-3"

    inactive_link_specific_classes = "text-gray-400 hover:bg-gray-100 hover:rounded-lg"
    inactive_icon_classes = "text-gray-400"

    active_link_specific_classes = "font-semibold bg-gray-200 p-3 rounded-lg"
    active_icon_classes = "text-black"

    link_classes = is_active ? "#{base_link_classes} #{active_link_specific_classes}" : "#{base_link_classes} #{inactive_link_specific_classes}"
    icon_classes = is_active ? active_icon_classes : inactive_icon_classes

    # Genera el link_to con el bloque
    link_to(path, class: link_classes) do
      # Usamos safe_join para concatenar HTML de forma segura dentro del bloque
      safe_join([
        tabler_icon(icon_name, size: "20", class: icon_classes),
        content_tag(:span, text)
      ])
    end
  end
end
