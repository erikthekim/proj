class PartiesController < ApplicationController
    before_action :set_party, only: %i[ show edit update destroy ]
    before_action :check_authorization, only: [:destroy]
  
    # GET /parties or /parties.json
    def index
      @parties = Party.all
    end
      
  
    # GET /parties/1 or /parties/1.json
    def show
    end
  
    # GET /parties/new
    def new
      @party = Party.new
      render 'parties/new'
    end

    
    
    # GET /parties/1/edit
    def edit
    end
  
    # POST /parties or /parties.json
    def create
      
      @party = Party.new(party_params)
      @party.host = current_user.name  # Assuming the user model has a username
  
  
      respond_to do |format|
        if @party.save
          format.html { redirect_to root_path, notice: "Party was successfully created." }
          format.json { render :show, status: :created, location: @party }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @party.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /parties/1 or /parties/1.json
    def update
      respond_to do |format|
        if @party.update(party_params)
          format.html { redirect_to party_url(@party), notice: "Party was successfully updated." }
          format.json { render :show, status: :ok, location: @party }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @party.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /parties/1 or /parties/1.json
    def destroy
      @party.destroy!
  
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Party was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
   
 # app/controllers/parties_controller.rb
def upvote
  update_vote("up")
end

def downvote
  update_vote("down")
end
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

def update_vote(type)
  party = Party.find(params[:id])
  existing_vote = current_user.user_votes.find_by(party: party)

  if existing_vote&.vote_type == type
    # If trying to repeat the same vote, remove it
    existing_vote.destroy
    party.decrement!(:interest_count) if type == "up"
    party.increment!(:interest_count) if type == "down"
    message = "Vote removed."
  else
    # Add new vote or change existing vote
    existing_vote&.destroy
    current_user.user_votes.create!(party: party, vote_type: type)
    party.increment!(:interest_count) if type == "up"
    party.decrement!(:interest_count) if type == "down"
    message = "Thank you for your vote!"
  end

  respond_to do |format|
    format.html { redirect_to parties_url, notice: message }
    format.json { render json: { success: true, newInterestCount: party.interest_count, message: message } }
  end
end

      def set_party
        @party = Party.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def party_params
        params.require(:party).permit(:title, :description, :interest_count, :content, :time, :host, :alcohol_available)
      end
      def check_authorization
        unless current_user.name == @party.host 
          redirect_to admin_parties_path, alert: "You are not authorized to perform this action."
        end
      end
      
  end
  