class Admin::LinksController < Admin::ResourcesController

  def index
    @reported_links = Link.reported
  end

  def update
    state_changed = accept_or_deny!
    update! { redirect_path(state_changed) }
  end

  protected

  def collection
    @links ||= end_of_association_chain.submitted
  end

  private

  def accept_or_deny!
    case params[:commit]
    when I18n.t("admin.links.edit.accept")
      resource.accept!
    when I18n.t("admin.links.edit.deny")
      resource.deny!
    end
  end

  def redirect_path(state_changed)
    if state_changed and link = Link.submitted.first
      edit_admin_link_path(link)
    else
      admin_links_path
    end
  end

end
