class User < ActiveRecord::Base
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  validates :first_name ,presence: true ,length:{maximum: 30}
  validates :last_name ,presence: true ,length:{maximum: 30}
  validates :username ,presence: true ,length: {maximum: 10} ,uniqueness: true
  #password have only numbers and alphabets
  validates :password ,format: {with: /\A^[0-9 a-z A-Z]*$\Z/} , length: {minimum: 8,:message => " should contain numbers and alphabets"}
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def reset_password(user)
    #use securerandom.hex beacuse password contain numbers and aplphabates
    generated_password = secure_random_token
    user.update_attributes(:password => generated_password ,:password_confirmation => generated_password)
    UserMailer.forgot_password_email(user,generated_password).deliver
  end

  def secure_random_token
    SecureRandom.hex(4)
  end
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_hash).first
    end
  end
end
