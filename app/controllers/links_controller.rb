class LinksController < ResourcesController

  def create
    create! { root_path }
  end

  protected

  def build_resource
    @link = super
    @link.creator = current_user if user_signed_in?
    @link
  end

  def collection
    @links ||= end_of_association_chain.visible
  end

end
