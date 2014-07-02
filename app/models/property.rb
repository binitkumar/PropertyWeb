class Property < ActiveRecord::Base
  translates :title, :short_desc, :price, :property_for, :landmark, :location, :property_in,
    :parking, :flooring, :furnishing, :open_for_inspection, :address, :city, :district, :zipcode, :available_from

  after_save :update_translations

  def update_translations
    source_locale = self.posting_local
    dest_locale   = ( ["en", "zh-CN"] - [ source_locale ] ).first
    puts dest_locale
    
    I18n.locale = dest_locale.to_sym
    self.attributes.keys.each do |key|
      self.update_column(key.to_sym, self[key.to_sym].to_s + "_" + dest_locale.to_s )
    end 
    I18n.locale = source_locale.to_sym
  end
end
