module UsersHelper
	

    def authenticate_safely(user_name, password)
  	  User.where("user_name = ? AND password = ?", user_name, password).first
  	end
    
end
