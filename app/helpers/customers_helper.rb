module CustomersHelper
  def user_avatar(name, color = "#9576F5")
    initials = name.split.first[0].upcase
    svg = <<-SVG
      <svg width="40" height="40" xmlns="http://www.w3.org/2000/svg">
        <circle cx="20" cy="20" r="20" fill="#{color}" />
        <text x="50%" y="50%" font-size="14" font-family="Arial" fill="white" text-anchor="middle" alignment-baseline="central">
          #{initials}
        </text>
      </svg>
    SVG
    raw svg
  end
end
