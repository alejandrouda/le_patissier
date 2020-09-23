class CartsController < ApplicationController
    before_action :set_cart, only: [:show, :edit, :update,:destroy]

def index
end

def show
end

def new
end

def edit
end

def create
end

def update
end

def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    redirect_to carts_url, notice: "Cart was succesfully destroyed."
end

private

def set_cart
    @cart = Cart.find(params[:id])
end

def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to root_path, notice: "That cart doesn't exist"
end

end
