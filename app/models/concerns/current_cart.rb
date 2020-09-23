module CurrentCart

private

    def set_cart
        if current_user
            @cart = current_user.carts.find_by(id: session[:cart_id]) || current_user.carts.create
            session[:cart_id] = @cart.id
        end
    end

end