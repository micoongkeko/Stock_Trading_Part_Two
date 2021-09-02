class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :send_admin_mail
  after_update :send_confirmation_email

def send_admin_mail
  UserMailer.send_welcome_email(self).deliver
end

def send_confirmation_email
  if approved == true 
    UserMailer.send_approved_email(self).deliver
  end
end


def active_for_authentication? 
    super && approved? 
  end 
    
  def inactive_message 
    approved? ? super : :not_approved
  end
end
