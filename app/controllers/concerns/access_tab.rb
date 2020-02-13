module AccessTab
  extend ActiveSupport::Concern

  def restrict_access
    return redirect_to(root_path, { success: t('.login_success') }) if current_user
  end
end
