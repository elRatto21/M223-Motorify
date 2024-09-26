class UserPolicy < ApplicationPolicy
  def index?
    user.admin? || user.manager?  # Only admin and manager can view users
  end

  def show?
    user.admin? || user.manager? || record == user  # Admin, manager, or the user himself
  end

  def new?
    true
  end

  def create?
    true  # Only admin can create users
  end

  def update?
    user.admin? || record == user # Admin and user himself can update regular user
  end

  def destroy?
    user.admin?  # Only admin can delete users
  end
end
