class BrokenLinkReportsController < ResourcesController
  belongs_to :link

  def create
    create! { root_path }
  end
end
