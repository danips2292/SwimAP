class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #:recoverable, :rememberable, :trackable, :validatable #,:confirmable
 has_one :initial_form
 has_one :group

 validates_confirmation_of :email
 has_secure_password

         
end
