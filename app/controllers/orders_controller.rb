class OrdersController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_order, only: [:show, :edit, :update, :destroy]


  respond_to do |format|
    format.html
    format.pdf do
      render pdf: “/orders/show.pdf.erb”
    end
  end

  # GET /orders
  # GET /orders.json
  def index
    @orders = current_user.user_profile.orders
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.user_profile_id = current_user.user_profile.id
    @order.order_number = "ecomm-#{Random.rand(1000..9999)}"
    @order.order_date = Date.today
    @order.order_status = "Order placed"

    respond_to do |format|
      if @order.save
        Notification.order_placed(@order).deliver
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { redirect_to cart_line_items_path, notice: "Please fill all fields" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def cancel_order
    @order = Order.find(params[:order_id])
    @order.update_attributes(order_status: "Canceled")
    Notification.order_canceled(@order).deliver
    redirect_to @order, notice: 'Order was successfully updated.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:order_number, :order_date, :total, :order_status, :payment_mode, :user_profile_id, :address_id)
    end
end
