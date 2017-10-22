class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #:recoverable, :rememberable, :trackable, :validatable #,:confirmable
 has_one :initial_form
 has_one :group
 has_many :comments
 has_many :ranking_lines
 has_many :videos

 
 

 EMAIL_REGEX = /\A[a-z0-9._-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i


  validates_presence_of :full_name, :message => 'no puede estar en blanco'
  
  validates_length_of :full_name , :maximum => 100
  validates_uniqueness_of :email, :message => "ya esta registrado. Intente Acceder a la cuenta"
  validates_presence_of :email, :message => 'no puede estar en blanco'
  validates_length_of :email, :maximum => 100
  validates_format_of :email, :with => EMAIL_REGEX, :message => "no es valido"
  validates_confirmation_of :email, :message => "no coincide"
  validates_presence_of :password, :message => 'no puede estar en blanco'
  has_secure_password
          
end
