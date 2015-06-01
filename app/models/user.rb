class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable,
    :database_authenticatable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable,
    :invitable,
    :invite_for => 2.weeks
end
