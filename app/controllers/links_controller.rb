class LinksController < ResourcesController

  def create
    create! { root_path }
  end

  protected

  def collection
    @links ||= end_of_association_chain.visible
  end

end
