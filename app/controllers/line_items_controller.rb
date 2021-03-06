class LineItemsController < ApplicationController
    include CurrentCart
    before_action :set_line_item, only: [:show, :edit, :update, :destroy]
    before_action :set_cart, only: [:create]

    def index
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
        product = Product.find(params[:product_id])
        @line_item = @cart.add_instrument(product)
        if @line_item.save
            redirect_to @line_item.cart, notice: 'Item added to cart.'
        else
            render :new
        end
    end

    def update
    end

    def destroy
        @cart = Cart.find(session[:cart_id])
        @line_item.destroy
        redirect_to cart_path(@cart), notice: 'Producto eliminado'
    end

    private

    def set_line_item
        @line_item = LineItem.find(params[:id])
    end

    def line_item_params
        params.require(:line_item).permit(:product_id)
    end

end
