class LinksController < ResourcesController

  protected

  def collection
    @links ||= end_of_association_chain.visible
  end

end
