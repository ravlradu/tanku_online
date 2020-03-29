class HomeController < ApplicationController

  def index
    @main_categories = Category.where(parent_id:nil)
  end
end
