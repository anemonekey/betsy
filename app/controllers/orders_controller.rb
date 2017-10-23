class OrdersController < ApplicationController
  # check if logged in at first

  def index
    # show only the orders that belong to the merchant
    if session[:merchant]
      merchant_id = session[:merchant]['id']
      @orders = Merchant.find(merchant_id).orders
    end
  end

  def new
    # new order, either with no merchant_id or with the logged-in-user's merchant_id
    @order = Order.new
  end

  def create
    # create new order, either with no merchant_id or with the logged-in-user's merchant_id
    @order = Order.new(order_params)
    if @order.save
      flash[:status] = :success
      flash[:message] = "Successfully created order"
      redirect_to orders_path
    else
      flash.now[:status] = :failure
      flash.now[:message] = "Failed to create order"
      flash.now[:details] = @order.errors.messages
      render :new, status: :bad_request
    end
  end

  def show
    # show the desired order
    find_order_by_params_id
  end

  def update
    # edit the desired order
    if find_order_by_params_id
      @order.update_attributes(order_params)
      if @order.save
        redirect_to order_path(@order)
        return
      else
        render :edit, status: :bad_request
        return
      end
    end
  end

  def destroy
    # if the order belongs to the user, can destroy it
    if find_order_by_params_id
      @order.destroy
      flash[:status] = :success
      flash[:message] = "Deleted order"
      redirect_to orders_path
    end
  end

  private

  def order_params
    return params.require(:order).permit(:cust_name, :status, :cust_email, :cust_cc, :cust_cc_exp, :cust_addr, :merchant_id)
  end

  def find_order_by_params_id
    @order = Order.find_by(id: params[:id])
    unless @order
      head :not_found
    end
    return @order
  end
end
