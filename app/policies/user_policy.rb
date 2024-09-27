class UserPolicy < ApplicationPolicy
  def index?
    user.admin? || user.teamleader?  # Only admin and manager can view users
  end

  def show?
    user.admin? || user.teamleader? || record == user  # Admin, manager, or the user himself
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
