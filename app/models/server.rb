class Server < ActiveRecord::Base
  attr_accessible :name, :status, :url

  validates :name, presence: true
  validates :url, presence: true, 
            format: { :with => /^(http|https):\/\/([a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}|(25[0-5]|2[0-4]\d|[0-1]?\d?\d)(\.(25[0-5]|2[0-4]\d|[0-1]?\d?\d)){3}|localhost)(:[0-9]{1,5})?(\/.*)?$/ix }

  after_create :update_status

  belongs_to :user

  def update_status
    link_status = LinkStatus.new full_uri
    update_attribute(:status, interpreat_status(link_status.status))
  end

  def self.update_statuses
  	all.each do |server|
  		server.update_status
  	end
  end

  def full_uri
    url
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
