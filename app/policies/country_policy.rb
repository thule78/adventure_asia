class CountryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create
    record.user == user
  end

  def update?
    true
  end

  def destroy?
    true
  end
end
