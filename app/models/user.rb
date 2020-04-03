class User < ApplicationRecord
  has_many :lists
  
  has_many :items, through: :lists

  validates :username, :email, presence: true

  validates :email, uniqueness: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

         def self.from_omniauth(access_token)
            data = access_token.info   
            user =User.find_or_create_by(email: data['email']) do |u|       
             u.email = data['email']
             u.username = data['name']       
              u.password = SecureRandom.hex    
              
            end
   


        #   data = access_token.info
        #   user = User.find_by(username: data['username'],
        #   email: data['email'])
      
        #   # Uncomment the section below if you want users to be created if they don't exist
        #   unless user
        #       user = User.create(username: data['username'],
        #          email: data['email'],
        #          password: Devise.friendly_token[0,20]
        #       )
        #   end
        #   user
      end


    
end
