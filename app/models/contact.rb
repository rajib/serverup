class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :contacts_server
  has_many :servers,through: :contacts_server
  attr_accessible :email, :name
  attr_accessible :email, :name, :user_id
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, :format => { :with => /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/,
    :message => "Invalid Email" }

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
  
end
