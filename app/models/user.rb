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

    # def valid_password?(password)
    #   if ::Rails.env == "development"
    #     true
    #   else
    #     super
    #   end
    # end


end
