class ProfilesController < ApplicationController

	def new
		@user = User.find(params[:user_id])
    @profile = @user.build_profile
	end
	
  def destroy		
	end

	def show
		@user = User.find(params[:user_id])
		@profile = Profile.find_by_user_id(params[:user_id])
	end

	def create
		@user = User.find(params[:user_id])
      @profile = @user.build_profile(profile_params)
		if @profile.save
     		redirect_to user_profile_path(:user_id =>@profile.user_id, :id =>@profile.id)
		else
			render action: 'new'
		end
	end

	def update
		@user=User.find(params[:user_id])
		@profile = Profile.find(params[:id])
    	if @profile.update_attributes(profile_params)
    		redirect_to user_profile_path, notice: 'Your Profile is updated.' #redirecting to usrs/show.html    
    	else
    		render action: 'edit'
    	end  	
	end

	def edit
		@user = User.find(params[:user_id])
    @profile = @user.profile
	end

	def index
    @profile=Profile.find_by_user_id(params[:user_id])
    if @profile
      redirect_to user_profile_path(:user_id =>params[:user_id], :id =>@profile.id)
    else
      redirect_to new_user_profile_path(:user_id =>params[:user_id])
		end
	end

	private

	def profile_params
	  params.require(:profile).permit(:avatar, :age, :name, :about, :hometown, :currentcity, :occupation, :contactno)
	end

end
