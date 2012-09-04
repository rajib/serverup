class Server < ActiveRecord::Base
  attr_accessible :name, :status

  validates :name, presence: true, 
            format: { :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix },
            uniqueness: {scope: :user_id}

  after_create :update_status

  belongs_to :user

  def update_status
    link_status = LinkStatus.new name
    update_attribute(:status, interpreat_status(link_status.status))
  end

  def self.update_statuses
  	all.each do |server|
  		link_status = LinkStatus.new server.name
  		server.update_attribute(:status, server.interpreat_status(link_status.status))
  	end
  end

  def interpreat_status(code)
  	if ((200..206).to_a + (300..307).to_a).include?(code)
  		"up"
  	elsif ((400..417).to_a + (500..505).to_a).include?(code)
  		"down"
  	else
  		"error"
  	end
  end
end
