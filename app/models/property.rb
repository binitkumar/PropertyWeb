class Property < ActiveRecord::Base
  geocoded_by :full_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates


  translates :title, :short_desc, :price, :property_for, :landmark, :location, :property_in,
    :parking, :flooring, :furnishing, :open_for_inspection, :address, :city, :district, :zipcode, :available_from

  after_save :update_translations

  has_attached_file :photo
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  include ActiveModel::Validations
  validates_presence_of :title, :short_desc, :price, :property_for, :landmark, :location, :address, :city, :district, :zipcode

  belongs_to :user


  def update_translations
    source_locale = self.posting_local
    dest_locale   = ( ["en", "zh-CN"] - [ source_locale ] ).first
    puts dest_locale
    
    I18n.locale = dest_locale.to_sym
    self.attributes.keys.each do |key|
      self.update_column(key.to_sym, self[key.to_sym].to_s + "_" + dest_locale.to_s ) unless key.match /photo/
    end 
    I18n.locale = source_locale.to_sym
  end

  def full_address
    [self.address, self.city, self.district, self.zipcode].join(", ")
  end
end
