class Server < ActiveRecord::Base
  attr_accessible :name, :status, :port, :url

  validates :name, presence: true
  validates :url, presence: true, 
            format: { :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix }
  validates :port, numericality: true, allow_blank: true

  after_create :update_status

  belongs_to :user

  def update_status
    link_status = LinkStatus.new full_uri
    update_attribute(:status, interpreat_status(link_status.status))
  end

  def self.update_statuses
  	all.each do |server|
  		link_status = LinkStatus.new server.full_uri
  		server.update_attribute(:status, server.interpreat_status(link_status.status))
  	end
  end

  def full_uri
    port ? "#{url}:#{port}" : url
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
