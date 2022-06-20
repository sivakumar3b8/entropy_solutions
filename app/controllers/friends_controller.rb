class FriendsController < ApplicationController
  before_action :set_friend, only: %i[ show edit update destroy ]

  # GET /friends or /friends.json
  def index
    @friends = Friend.all
  end

  # GET /friends/1 or /friends/1.json
  def show
  end

  def new
  session[:friend_params] ||= {}
   @friend  = Friend.new(session[:friend_params])
   @friend .current_step = session[:order_step]
end

  # GET /friends/1/edit
  def edit
  end


  def create
    session[:order_params].deep_merge!(params[:order]) if params[:friend]
    @friend = Order.new(session[:friend_params])
    @friend.current_step = session[:order_step]
    if @friend.valid?
      if params[:back_button]
        @friend.previous_step
      elsif @friend.last_step?
        @friend.save if @friend.all_valid?
      else
        @friend.next_step
      end
      session[:order_step] = @friend.current_step
    end
    if @friend.new_record?
      render "new"
    else
      session[:order_step] = session[:friend_params] = nil
      flash[:notice] = "Order saved!"
      redirect_to @friend
    end
  end

  # PATCH/PUT /friends/1 or /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to friend_url(@friend), notice: "Friend was successfully updated." }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1 or /friends/1.json
  def destroy
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to friends_url, notice: "Friend was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_params
      params.require(:friend).permit(:first_name, :last_name, :phone_number, :bank_account_number, :ifsc_code, :swift_number, :index, :new, :show)
    end
end
