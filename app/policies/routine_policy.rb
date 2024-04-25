class RoutinePolicy < ApplicationPolicy
  attr_reader :user, :routine

  def initialize(user, routine)
    @user = user
    @routine = routine
  end

  def index?
    true
  end

  def show?
    user == routine.user
  end

  def new? 
    true
  end

  def create?
    true
  end

  def edit?
    true
  end

  def destroy?
    user == routine.user   
  end

end
