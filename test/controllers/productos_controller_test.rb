# require "test_helper"

# class ProductosControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @producto = productos(:one)
#   end
#   require "test_helper"
#   #validar que la pagina de edicion cargue correctamente
#   test "should get edit" do
#     get edit_producto_url(@producto)  
#     assert_response :success
#   end
#   #validar que la pagina muestre el título "Product Edition" con el
#   #formato h2
#   test "should show title 'Product Edition'" do
#     get edit_producto_url(@producto)  
#     assert_select 'h2', text: 'Product Edition'
#   end

#   #validar que se muestre el mensaje "Product not registered" cuando
#   #el producto no exista
#   test "should show 'Product not registered' when product does not exist" do
#     get edit_producto_url(id: 'nonexistent_id')  
#     assert_response :redirect  
#     follow_redirect!
#     assert_select 'p', text: 'Product not registered'
#   end
  
#   #validacion q todos los campos esten llenos
#   test "should be valid with all fields filled" do
#     product = Producto.new(name:"Ryzen 7 5700g", price: 800, description: "8 nucleos\n16 hilos")
#     assert product.valid?
#   end

#   #validamos q el producto tenga nombre
#   test "the product should have name" do
#     product = Producto.new(name:"Ryzen 7 5700g", description: "8 nucleos\n16 hilos")
#     assert_not product.valid?
#   end

#   test "the product should have price" do
#     product = Producto.new(price: 800, description: "8 nucleos\n16 hilos")
#     assert_not product.valid?
#   end

#   test "the product should have description" do
#     product = Producto.new(name:"Ryzen 7 5700g",price: 800)
#     assert_not product.valid?
#   end

#   test "the product is null" do
#     product = Producto.new()
#     assert_not product.valid?
#   end

#   test "the product price is greater than zero" do 
#     product = Producto.new(name:"Ryzen 7 5700g", price: 0, description: "8 nucleos\n16 hilos")
#     product.valid?
#     assert_includes product.errors[:price], "must be greater than 0"
#   end

#   #validar que se inhabilite el botón para guardar los cambios
#   #si alguno de los campos se encuentra en blanco
#   test "should disable save button if any field is blank" do
#     get edit_producto_path(@producto)  
#     patch producto_path(@producto), params: { producto: { name: '', price: '', description: '' } }
#     assert_response :unprocessable_entity
#     assert_select 'input[type=submit][disabled]'
#   end
  
# end


#   # test "should get index" do
#   #   get productos_url
#   #   assert_response :success
#   # end

#   # test "should get new" do
#   #   get new_producto_url
#   #   assert_response :success
#   # end

#   # test "should create producto" do
#   #   assert_difference("Producto.count") do
#   #     post productos_url, params: { producto: { description: @producto.description, name: @producto.name, price: @producto.price } }
#   #   end

#   #   assert_redirected_to producto_url(Producto.last)
#   # end

#   # test "should show producto" do
#   #   get producto_url(@producto)
#   #   assert_response :success
#   # end

#   # test "should get edit" do
#   #   get edit_producto_url(@producto)
#   #   assert_response :success
#   # end

#   # test "should update producto" do
#   #   patch producto_url(@producto), params: { producto: { description: @producto.description, name: @producto.name, price: @producto.price } }
#   #   assert_redirected_to producto_url(@producto)
#   # end

#   # test "should destroy producto" do
#   #   assert_difference("Producto.count", -1) do
#   #     delete producto_url(@producto)
#   #   end

#   #   assert_redirected_to productos_url
#   # end



  require "test_helper"

  class ProductosControllerTest < ActionDispatch::IntegrationTest
    setup do
      @producto = productos(:one)
    end

    test "should get index" do
      get productos_url
      assert_response :success
    end

    test "should get new" do
      get new_producto_url
      assert_response :success
    end

    test "should create producto" do
      assert_difference("Producto.count") do
        post productos_url, params: { producto: { name: "New Product", price: 100, description: "New product description" } }
      end

      assert_redirected_to producto_url(Producto.last)
    end

    test "should show producto" do
      get producto_url(@producto)
      assert_response :success
    end

    test "should get edit" do
      get edit_producto_url(@producto)
      assert_response :success
    end

    test "should update producto" do
      patch producto_url(@producto), params: { producto: { name: "Updated Product", price: 200, description: "Updated product description" } }
      assert_redirected_to producto_url(@producto)
    end

    test "should destroy producto" do
      assert_difference("Producto.count", -1) do
        delete producto_url(@producto)
      end

      assert_redirected_to productos_url
    end

    test "should show title 'Product Edition'" do
      get edit_producto_url(@producto)
      assert_select 'h2', text: 'Product Edition'
    end

    test "should show 'Product not registered' when product does not exist" do
      get edit_producto_url(id: 'nonexistent_id')
      assert_response :redirect
      follow_redirect!
      assert_select 'p', text: 'Product not registered'
    end

    test "should be valid with all fields filled" do
      product = Producto.new(name: "Ryzen 7 5700g", price: 800, description: "8 nucleos\n16 hilos")
      assert product.valid?
    end

    test "the product should have name" do
      product = Producto.new(price: 800, description: "8 nucleos\n16 hilos")
      assert_not product.valid?
    end

    test "the product should have price" do
      product = Producto.new(name: "Ryzen 7 5700g", description: "8 nucleos\n16 hilos")
      assert_not product.valid?
    end

    test "the product should have description" do
      product = Producto.new(name: "Ryzen 7 5700g", price: 800)
      assert_not product.valid?
    end

    test "the product is null" do
      product = Producto.new
      assert_not product.valid?
    end

    test "the product price is greater than zero" do
      product = Producto.new(name: "Ryzen 7 5700g", price: 0, description: "8 nucleos\n16 hilos")
      product.valid?
      assert_includes product.errors[:price], "must be greater than 0"
    end

    test "should disable save button if any field is blank" do
      get edit_producto_path(@producto)
      patch producto_path(@producto), params: { producto: { name: '', price: '', description: '' } }
      assert_response :unprocessable_entity
      assert_select 'input[type=submit][disabled]'
    end
  end
