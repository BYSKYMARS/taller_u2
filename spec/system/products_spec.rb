require 'rails_helper'

RSpec.describe "Editing Products", type: :system do
  let!(:producto) { Producto.create!(name: "Laptop", price: 999.99, description: "A powerful laptop") }

  it "disables the save button when fields are empty" do
    visit edit_producto_path(producto) # Usa 'producto' en lugar de 'product'
    
    fill_in "Name", with: ""
    fill_in "Price", with: ""
    fill_in "Description", with: ""

    expect(page).to have_button("Save", disabled: true) # Asegúrate de que el botón se llama "Guardar"
  end
end