require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @update = { 
      title: 'Lorem Ipsum',
      description: 'Best book for web developers',
      image_url: '/images/pic3.jpg',
      price: 13.00
    }
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: {  title: @product. title, description: @product.description, image_url: @product.image_url, price: @product.price } }
    post products_url, params: { product: @update }      
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch products_url(@update), params: {product: @update}
    patch product_url(@product), params: { product: {  title: @product. title, description: @product.description, image_url: @product.image_url, price: @product.price } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
