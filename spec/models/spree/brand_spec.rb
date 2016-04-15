require 'spec_helper'

describe Spree::Brand do

  context 'product instance' do
    let(:brand) { create(:brand) }

    context '#deleted?' do
      it 'returns delete_at value' do
        expect(brand.deleted_at).to be_nil
      end
    end

    context '#available?' do
      it 'returns available_on value' do
        expect(brand.available?).to be_truthy
      end
    end

    context '#active?' do
      it 'returns available_on value' do
        expect(brand.active?).to eq('Active')
      end
    end
  end

end