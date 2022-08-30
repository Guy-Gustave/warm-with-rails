class MainController <ApplicationController
  def index
    flash[:notice] = "hello logged in"
    flash[:alert] = "wrong way"
  end  
end
