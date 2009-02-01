class GuildsController < PublicController

  before_filter :load_object

  def index
    respond_to do |format|
      format.html
    end
  end

  def show
    respond_to do |format|
      format.html
    end
  end

  private

  def load_object
    @realm = Realm.find_by_permalink(params[:realm_id]) if params[:realm_id]
    @guild = Guild.find_by_permalink(params[:id]) if params[:id]
  end

end
