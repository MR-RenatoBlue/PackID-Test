class User < ApplicationRecord
  
  validates :email, presence: true

  #rolify stuff
  rolify
  #callback to assign a default role to a new user
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:operator) if self.roles.blank?
  end
    
  #devise stuff

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.online
    ids = ActionCable.server.pubsub.redis_connection_for_subscriptions.smembers "online"
    where(id: ids)
  end
end
