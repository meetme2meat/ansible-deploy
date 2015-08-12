class User < ActiveRecord::Base
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
   validates :first_name ,presence: true ,length:{maximum: 30}
   validates :last_name ,presence: true ,length:{maximum: 30}
   validates :user_name ,presence: true ,length: {maximum: 10} ,uniqueness: true
   #password have only numbers and alphabets
   validates :password ,format: {with: /\A^[0-9 a-z A-Z]*$\Z/} , length: {minimum: 8,:message => "should contain numbers and alphabets"}

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
