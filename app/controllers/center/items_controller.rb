module Center
  class ItemsController < BaseController
    before_action :set_item, only: [:show, :edit, :update, :destroy]

    # GET /items
    # GET /items.json
    def index
      @items = Item.all
    end

    # GET /items/1
    # GET /items/1.json
    def show
    end

    # GET /items/new
    def new
      @item = Item.new
    end

    # GET /items/1/edit
    def edit
    end

    # POST /items
    # POST /items.json
    def create
      @item = current_admin.items.build(item_params)

      respond_to do |format|
        if @item.save
          current_admin.action_logs.add(target: :item, action: :new, action_value: item_params.to_s)
          format.html { redirect_to [:center, @item], notice: 'Item was successfully created.' }
          format.json { render :show, status: :created, location: @item }
        else
          format.html { render :new }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /items/1
    # PATCH/PUT /items/1.json
    def update
      respond_to do |format|
        if @item.update(item_params)
          current_admin.action_logs.create!(target: :item, action: :edit, action_value: item_params.to_s)
          format.html { redirect_to @item, notice: 'Item was successfully updated.' }
          format.json { render :show, status: :ok, location: @item }
        else
          format.html { render :edit }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /items/1
    # DELETE /items/1.json
    def destroy
      @item.destroy
      respond_to do |format|
        current_admin.action_logs.create!(target: :item, action: :delete, action_value: @item.inspect)
        format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :stock)
    end
  end
end
