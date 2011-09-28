class Admin::LinksController < Admin::ResourcesController

  def update
    accept_or_deny
    update! { admin_links_path }
  end

  protected

  def collection
    @links ||= end_of_association_chain.submitted
  end

  private

  def accept_or_deny
    case params[:commit]
    when I18n.t("admin.links.edit.accept")
      resource.accept!
    when I18n.t("admin.links.edit.deny")
      resource.deny!
    end
  end

end
