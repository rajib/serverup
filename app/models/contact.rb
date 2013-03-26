class Contact < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :servers
  attr_accessible :email, :name
  attr_accessible :email, :name, :user_id

  def self.populate_contacts(current_user)
  	contacts = Contact.where('user_id=?',current_user.id).select([:name, :email, :id])
    return contacts.to_json
  end
end
