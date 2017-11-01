class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #:recoverable, :rememberable, :trackable, :validatable #,:confirmable
 has_one :initial_form
 has_one :team_form
 has_one :group
 has_many :comments
 has_many :ranking_lines
 has_many :videos 
 has_many :conversations, :foreign_key => :sender_id

 
  scope :pending, lambda { where(:is_accepted => false).
                          order(:group_id) }

  scope :accepted, lambda { where(:is_accepted => true).  order(:group_id)}

  scope :accepted_by_group, lambda { |id| where(:group_id => id).
                                      where(:is_accepted => true).
                                      order(:group_id)}

 EMAIL_REGEX = /\A[a-z0-9._-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates_presence_of :full_name, :message => 'no puede estar en blanco'
  validates_length_of :full_name , :maximum => 100
  validates_uniqueness_of :email, :message => "ya esta registrado. Intente Acceder a la cuenta"
  validates_presence_of :email, :message => 'no puede estar en blanco'
  validates_length_of :email, :maximum => 100
  validates_format_of :email, :with => EMAIL_REGEX, :message => "no es valido"
  validates_confirmation_of :email, :message => "no coincide"
  validates_presence_of :password, :message => 'no puede estar en blanco', on: :update, allow_blank: true
  has_secure_password
  scope :get_users_by_groups, lambda {|group_id_search| where(:group_id =>group_id_search )}
          
end
