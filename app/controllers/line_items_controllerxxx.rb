class LineItemsController < ApplicationController
  #skip_before_action :authorize, only: :create
  skip_before_action :authorize

  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index

    cart = Cart.find(?current cart?)
    @line_items = cart.line_items

    #@line_items = LineItem.order('created_at desc').page(params[:page])
    #@line_items = LineItem.page(params[:page])
    #@sausages = Sausage.all
    #@sausage = Sausage.find(:all, :order => 'name')
    puts "*******************************************"
    puts @line_items

      #name: params[:name]

      respond_to do |format|
          format.html { redirect_to @line_item.cart, notice: 'Sausage was added to Cart.' }
          format.json { render :show, status: :created, location: @line_item }
      end
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    p params
    sausage = Sausage.find(params[:sausage_id])
    @line_item = @cart.add_sausage(sausage.id)
    @line_item.quantity = params[:qty_to_purchase]
    puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    puts @line_item.quantity.to_s

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart, notice: 'Sausage was added to Cart.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def line_item_params
    params.require(:line_item).permit(:sausage_id)
  end

  def total_price
    sausage.price * quantity
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      #params.require(:line_item).permit(:sausage_id, :cart_id)
      params.require(:line_item).permit(:sausage_id, :card_id)
    end
end
