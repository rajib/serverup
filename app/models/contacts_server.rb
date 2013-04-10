class ContactsServer < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :server
  belongs_to :contact
end
