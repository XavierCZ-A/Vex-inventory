module ApplicationHelper
  include Pagy::Frontend
  def sidebar_link(text:, path:, icon_name:)
    is_active = current_page?(path)

    # Clases base comunes para todos los enlaces
    base_link_classes = "flex items-center space-x-3 text-sm rounded-sm p-2"

    # Clases específicas para estado inactivo
    inactive_link_specific_classes = "text-gray-400 hover:bg-gray-200 hover:rounded-lg"
    inactive_icon_classes = "text-gray-400"

    # Clases específicas para estado activo (Asumiendo border-r-4 y añadiendo color de texto)
    active_link_specific_classes = "font-semibold border-r-4 border-[#7C5BF3] text-[#7C5BF3]" # ¡OJO con border-r-4!
    active_icon_classes = "text-[#7C5BF3]"

    # Combina las clases según el estado
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
