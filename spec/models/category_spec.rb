require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Associations' do
    it 'has many products' do
      # Crear una organización requerida primero
      organization = create(:organization) # Asume que tienes una factory :organization

      # Crear una categoría usando Factory Bot
      category = create(:category) # Si Category también necesita una Organization, ajústalo

      # Crear productos asociados a la categoría Y a la organización
      product1 = create(:product, category: category, organization: organization)
      product2 = create(:product, category: category, organization: organization)

      # Verificar que los productos asociados sean correctos
      # Recargar la categoría para asegurar que la asociación se cargue desde la BD
      category.reload
      expect(category.products).to include(product1, product2)
      # O una verificación más estricta:
      # expect(category.products.ids).to match_array([product1.id, product2.id])
    end
  end
end
