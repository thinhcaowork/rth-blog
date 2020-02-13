class UserDecorator < Draper::Decorator
  delegate_all

  def fullname
    "#{object.first_name} #{object.last_name}"
  end
end
