class Admin::PartiesController < AdminController
  before_action :set_party, only: %i[ show edit update destroy ]
  before_action :check_authorization, only: [:destroy]

  # GET /parties or /parties.json
  def index
    @admin_parties = Party.all
  end

  # GET /parties/1 or /parties/1.json
  def show
  end

  # GET /parties/new
  def new
    @admin_party = Party.new
    render 'admin/parties/new'
  end

  # GET /parties/1/edit
  def edit
  end

  # POST /parties or /parties.json
  def create
    
    @party = Party.new(party_params)
    @party.host = current_user.name  # Assuming the user model has a username


    respond_to do |format|
      if @admin_party.save
        format.html { redirect_to party_url(@admin_party), notice: "Party was successfully created." }
        format.json { render :show, status: :created, location: @admin_party }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_party.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parties/1 or /parties/1.json
  def update
    respond_to do |format|
      if @admin_party.update(party_params)
        format.html { redirect_to party_url(@admin_party), notice: "Party was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_party }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_party.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parties/1 or /parties/1.json
  def destroy
    @admin_party.destroy!

    respond_to do |format|
      format.html { redirect_to parties_url, notice: "Party was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  # app/controllers/parties_controller.rb
def increment_interest
  @admin_party = Party.find(params[:id])
  @admin_party.increment!(:interest_count)
  respond_to do |format|
    format.html { redirect_to root_path, notice: 'Interest count updated.' }
    format.js   # Assuming you might want to use AJAX to handle this in the future
  end
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party
      @admin_party = Party.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def party_params
      params.require(:party).permit(:title, :description, :interest_count, :content, :time, :host, :alcohol_available)
    end
    def check_authorization
      unless current_user.name == @admin_party.host 
        redirect_to admin_parties_path, alert: "You are not authorized to perform this action."
      end
    end
    
end
