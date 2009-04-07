class RealmsController < PublicController

  before_filter :load_object

  def index
    @regions = Region.find(:all)
    
    respond_to do |format|
      format.html
    end
  end

  def show
    @guilds = @realm.guilds

    respond_to do |format|
      format.html
    end
  end


  private

  def load_object
    @realm = Realm.find_by_permalink(params[:id]) if params[:id]
  end

end
