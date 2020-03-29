module Center
  class AcquiresController < BaseController

    # GET /acquires
    # GET /acquires.json
    def index
      @acquires = Acquire.paginate(page: params[:page]).order(id: :desc)
    end

    # GET /acquires/1
    # GET /acquires/1.json
    def show
    end

    # GET /acquires/new
    def new
      @acquire = Acquire.new
    end

    # GET /acquires/1/edit
    def edit
    end

    # POST /acquires
    # POST /acquires.json
    def create
      @acquire = Acquire.new(acquire_params)

      respond_to do |format|
        if @acquire.save
          format.html { redirect_to [:center, @acquire], notice: 'Acquire was successfully created.' }
          format.json { render :show, status: :created, location: @acquire }
        else
          format.html { render :new }
          format.json { render json: @acquire.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /acquires/1
    # PATCH/PUT /acquires/1.json
    def update
      respond_to do |format|
        if @acquire.update(acquire_params)
          format.html { redirect_to [:center, @acquire], notice: 'Acquire was successfully updated.' }
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
        format.html { redirect_to center_acquires_url, notice: 'Acquire was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_acquire
      @acquire = Acquire.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def acquire_params
      params.fetch(:acquire, {})
    end
  end
end
