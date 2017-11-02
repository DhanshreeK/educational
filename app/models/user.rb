class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :general_setting
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def create_general_setting
    role = 'Student'
    role = 'SuperAdmin' if id == 1
    gs = GeneralSetting.create(registered_name: 'Vishwa Vidya consultancy Pvt. Ltd.')
    update(general_setting_id: gs.id, role: role)
  end

   # getter for current user
  def self.current
    Thread.current[:user]
  end

  # setter for current user
  def self.current=(user)
    Thread.current[:user] = user
  end
  
end
