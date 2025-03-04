require "application_system_test_case"

class ProductosTest < ApplicationSystemTestCase
  setup do
    @producto = productos(:one)
    visit edit_producto_path(@producto)
  end

  test "save button is disabled if any field is blank" do
    
    # Limpiar los campos
    fill_in "Name", with: ""
    sleep 1
    assert page.has_button?("Save",disabled: true)
  end
  
  # test "visiting the index" do
  #   visit productos_url
  #   assert_selector "h1", text: "Productos"
  # end

  # test "should create producto" do
  #   visit productos_url
  #   click_on "New producto"

  #   fill_in "Description", with: @producto.description
  #   fill_in "Name", with: @producto.name
  #   fill_in "Price", with: @producto.price
  #   click_on "Create Producto"

  #   assert_text "Producto was successfully created"
  #   click_on "Back"
  # end

  # test "should update Producto" do
  #   visit producto_url(@producto)
  #   click_on "Edit this producto", match: :first

  #   fill_in "Description", with: @producto.description
  #   fill_in "Name", with: @producto.name
  #   fill_in "Price", with: @producto.price
  #   click_on "Update Producto"

  #   assert_text "Producto was successfully updated"
  #   click_on "Back"
  # end

  # test "should destroy Producto" do
  #   visit producto_url(@producto)
  #   click_on "Destroy this producto", match: :first

  #   assert_text "Producto was successfully destroyed"
  # end
end
