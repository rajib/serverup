class Contact < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :servers
  attr_accessible :email, :name
  attr_accessible :email, :name, :user_id

  def self.populate_contacts(current_user, server_id)
    server = Server.find server_id
    
    already_added_contact_ids = server.contacts.map {|c| c.id}
    
    if already_added_contact_ids.empty?
       contacts = Contact.where('user_id=?',current_user.id).select([:name, :email, :id])
    else
       contacts = Contact.where('user_id=? and id NOT IN (?)',current_user.id, already_added_contact_ids).select([:name, :email, :id])
    end
  
     return contacts.to_json

  end

  def self.already_added_contact(current_user, server_id)
    server = Server.find server_id
    
    already_added_contact_ids = server.contacts.map {|c| c.id}
    
    if already_added_contact_ids.empty?
       contacts = Contact.where('user_id=?',current_user.id).select([:name, :email, :id])
    else
       contacts = Contact.where('user_id=? and id NOT IN (?)',current_user.id, already_added_contact_ids).select([:name, :email, :id])
    end
  
     return contacts    
  end
end
