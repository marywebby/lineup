class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :about, :contact]
  skip_after_action :verify_authorized

  def index
  end

  def about
  end

end
