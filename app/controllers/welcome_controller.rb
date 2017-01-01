class WelcomeController < ApplicationController
  def index
    flash[:warning] = '已经很晚了！'
  end
end
