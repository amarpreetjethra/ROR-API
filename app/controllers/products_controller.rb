class ProductsController < ApplicationController
  def index
    @lat = params[:lat].to_s
    @lng = params[:long].to_s
    @result = HTTParty.get("https://api.uber.com/v1/products?server_token=50izbpXA5spz38mpNxof4_MHoVbIK8Ak0s_PwtU_&latitude="+@lat+"&longitude="+@lng).parsed_response
   
   

    respond_to do |format|
        format.json { render :json => JSON.parse(@result) }
        
        format.html { render "index.html.erb" }
    end  
    
    

  end
end
