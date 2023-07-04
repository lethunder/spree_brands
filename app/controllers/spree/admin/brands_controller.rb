module Spree
  module Admin
    class BrandsController < ResourceController
      include Spree::Admin::BaseHelper
      rescue_from ActiveRecord::RecordNotFound, with: :render_404

      before_action :load_brand, only: [:edit, :destroy]

      def index
        respond_with(@collection)
      end

      def create
        @brand = Spree::Brand.new(brand_params)
        if @brand.save
          flash.now[:success] = flash_message_for(@brand, :successfully_created)
          render :edit
        else
          render :new
        end
      end

      def destroy
        if @brand.destroy
          flash[:success] = Spree.t('notice_messages.brand_deleted')
        else
          flash[:error] = Spree.t('notice_messages.brand_not_deleted')
        end

        respond_with(@brand) do |format|
          format.html { redirect_to admin_brands_path }
          format.js  { render_js_for_destroy }
        end
      end

      private

      def brand_params
        params.fetch(:brand, {}).permit(*permitted_attributes)
      end

      def permitted_attributes
        [
          :name,
          :description,
          :active,
          :image
        ]
      end

      def load_brand
        @brand = Spree::Brand.find(params[:id])
      end

      def collection
        return @collection if @collection.present?
        # params[:q] can be blank upon pagination
        params[:q] ||= {}

        @search = Spree::Brand.ransack(params[:q])
        @collection = @search.result.
          page(params[:page]).
          per(params[:per_page] || Spree::Backend::Config[:admin_products_per_page])
      end

    end
  end
end