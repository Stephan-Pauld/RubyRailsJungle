class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "jungle", password: "book"
  def show
    @products = Product.all
    @category = Category.all
  end
end
