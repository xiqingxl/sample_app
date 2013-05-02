module SessionsHelper

 def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.c_user = user
  end
 def signed_in?
   !c_user.nil?
 end
 def c_user=(user)
    @c_user = user
  end

 def c_user
    @c_user ||= User.find_by_remember_token(cookies[:remember_token])
 end

 def cc_user?(user)
   user == c_user
 end
 def sign_out
   self.c_user = nil
   cookies.delete(:remember_token)  
 end 
  
end
