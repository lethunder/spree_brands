# BRAND
# Brand represent an entity for sale in a store.

module Spree
  class Brand < Spree::Base
    validates :name, :description, :available_on, presence: true

    # use deleted? rather than checking the attribute directly. this
    # allows extensions to override deleted? if they want to provide
    # their own definition.
    def deleted?
      !!deleted_at
    end

    # determine if brand is available.
    # deleted brands and brands with nil or future available_on date
    # are not available
    def available?
      !(available_on.nil? || available_on.future?) && !deleted?
    end

    # determine if brand is active.
    # deleted brands and brands with nil or future available_on date
    # are not active
    def active?
      active == true ? Spree.t(:active) : Spree.t(:disabled)
    end
  end
end

require_dependency 'spree/product/scopes'