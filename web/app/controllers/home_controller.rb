class HomeController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.xml
    end
  end

end
