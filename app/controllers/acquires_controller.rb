class AcquiresController < BaseController
  before_action :set_acquire, only: [:show, :edit, :update, :destroy]

  # GET /acquires
  # GET /acquires.json
  def index
    @acquires = Acquire
                  .includes(:user, :item)
                  .paginate(page: params[:page])
                  .order(id: :desc)
  end

  # GET /acquires/1
  # GET /acquires/1.json
  def show
  end

  # GET /acquires/new
  def new
    @acquire = Acquire.new
    @items = Item.all
  end

  # GET /acquires/1/edit
  def edit
  end

  # POST /acquires
  # POST /acquires.json
  def create
    @items = Item.all
    @acquire = current_user.acquires.build(acquire_params)
    @acquire.with_lock do
      if @acquire.save
        @acquire.item.decrement!(:stock, @acquire.quantity)
        redirect_to acquires_path, notice: '领用成功'
      else
        render :new
      end
    end
  end

  # PATCH/PUT /acquires/1
  # PATCH/PUT /acquires/1.json
  def update
    respond_to do |format|
      if @acquire.update(acquire_params)
        format.html { redirect_to @acquire, notice: 'Acquire was successfully updated.' }
        format.json { render :show, status: :ok, location: @acquire }
      else
        format.html { render :edit }
        format.json { render json: @acquire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acquires/1
  # DELETE /acquires/1.json
  def destroy
    @acquire.destroy
    respond_to do |format|
      format.html { redirect_to acquires_url, notice: 'Acquire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_acquire
    @acquire = Acquire.find(params[:id])
    @items = Item.all
  end

  # Only allow a list of trusted parameters through.
  def acquire_params
    params.require(:acquire).permit(:item_id, :quantity)
  end
end
