require 'spec_helper'

describe Spree::Admin::BrandsController do
  stub_authorization!

  context '#index' do
    it 'should find Brands and render the view' do
      spree_get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  context '#create' do
    let(:brand) { build(:brand) }
    let(:valid_params) do
      {
        brand: {
          name: brand.name,
          description: brand.description,
          available_on: brand.available_on,
          active: brand.active
        }
      }
    end

    it 'is not routable' do
      spree_post :create, valid_params
      expect(response.status).to be(200)
    end

    it 'returns success with valid params' do
      expect {
        spree_post :create, valid_params
      }.to change(Spree::Brand, :count).by(1)
    end

    it 'raises error with invalid params' do
      spree_post :create, {}
      expect(response).to render_template(:new)
    end
  end

  context '#destroy' do
    let(:brand) { create(:brand) }

    def send_request
      spree_delete :destroy, id: brand
    end

    context 'will successfully destroy brand' do
      before do
        allow(Spree::Brand).to receive(:find).and_return(brand)
        allow(brand).to receive(:destroy).and_return(true)
      end

      describe 'records successfully' do
        before { send_request }

        it { change(Spree::Brand, :count).by(0) }
        it { expect(flash[:success]).to_not be_nil }
      end
    end

    context 'will not successfully destroy brand' do
      before do
        allow(Spree::Brand).to receive(:find).and_return(brand)
        allow(brand).to receive(:destroy).and_return(false)
      end

      describe 'returns an error' do
        before { send_request }

        it { expect(flash[:error]).to_not be_nil }
      end
    end
  end
end