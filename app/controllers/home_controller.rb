class HomeController < ApplicationController
    layout 'home'
    before_action :set_party, only: %i[increment_interest show edit update destroy ]
    before_action :authenticate_user!
    
    


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
    end
  
    # GET /parties/1/edit
    def edit
    end
  
    # POST /parties or /parties.json
    def create
      @admin_party = Party.new(party_params)
  
      respond_to do |format|
        if @admin_party.save
          format.html { redirect_to party_url(@admin_party), notice: "Party was successfully created." }
          format.json { render :show, status: :created, location: @admin_party }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @party.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /parties/1 or /parties/1.json
    def update
      respond_to do |format|
        if @admin_party.update(party_params)
          format.html { redirect_to party_url(@admin_party), notice: "Party was successfully updated." }
          format.json { render :show, status: :ok, location: @party }
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
    # app/controllers/home_controller.rb
def increment_interest
  @admin_party = Party.find(params[:id])
  
  respond_to do |format|
    if current_user.voted_parties.include?(@admin_party)
      format.html { redirect_to request.referer || root_path, alert: 'You have already shown interest in this party.' }
      format.js { render js: "alert('You have already shown interest in this party.');" }
    else
      current_user.user_votes.create(party: @admin_party)
      @admin_party.increment!(:interest_count)
      
      format.html { redirect_to root_path }
      format.js   
    end
  end
end

    

    
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_party
        @admin_party = Party.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def party_params
        params.require(:party).permit(:title, :description, :interest_count)
      end
  end
  