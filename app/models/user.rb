class User < ActiveRecord::Base
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
   validates :first_name ,presence: true ,length:{maximum: 30}
   validates :last_name ,presence: true ,length:{maximum: 30}
   validates :user_name ,presence: true ,length: {maximum: 10}
   #password have only numbers and alphabets
   validates :password ,format: {with: /\A^[0-9 a-z A-Z]*$\Z/} , length: {minimum: 8}

end
