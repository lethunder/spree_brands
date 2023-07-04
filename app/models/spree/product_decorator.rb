module Spree
  module ProductDecorator
    def self.prepended(base)
      base.attr_accessor :brand_id
      base.after_update :update_brand
    end

    def brand
      brand_name = product.property("brand")
      Spree::Brand.find_by(name: brand_name)
    end

    private
    def update_brand
      if brand_id.present? && (brand = Spree::Brand.find(brand_id))
        set_property("brand", brand.name)
      end
    end
  end
end


::Spree::Product.prepend Spree::ProductDecorator if ::Spree::Product.included_modules.exclude?(Spree::ProductDecorator)