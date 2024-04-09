class MessagesController < ApplicationController
  before_action :authenticate_user! 

  def select_products
    routine_type = params[:routine_type]
    @routine = Routine.new(name: routine_type, user: current_user) 
    @products = Product.all 
  end

  def generate_lineup
    @routine = current_user.routines.find(params[:routine_id])

    product_ids = params[:product_ids]
    product_ids.each do |product_id|
      @routine.products << Product.find(product_id)
    end

    chat_service = ChatService.new(message: params[:message], routine: @routine)
    @lineup = chat_service.call
  end
end
