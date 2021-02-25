# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.describe '/linkers', type: :request do
  let(:valid_attributes) do
    {
      email: 'test@t.cn',
      url: 'https://xxx.xxx.com/abc/def?ab=xxxxxxxx&xxxxxxx'
    }
  end

  let(:invalid_attributes) do
    {
      email: 'test@t.cn'
    }
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      linker = Linker.create! valid_attributes
      get linker_url(linker)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Linker' do
        expect do
          post linkers_url, params: { linker: valid_attributes }
        end.to change(Linker, :count).by(1)
      end

      it 'redirects to the created linker' do
        post linkers_url, params: { linker: valid_attributes }
        expect(response).to redirect_to(linker_url(Linker.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Linker' do
        expect do
          post linkers_url, params: { linker: invalid_attributes }
        end.to change(Linker, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post linkers_url, params: { linker: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested linker' do
      linker = Linker.create! valid_attributes
      expect do
        delete linker_url(linker)
      end.to change(Linker, :count).by(-1)
    end

    it 'redirects to the linkers list' do
      linker = Linker.create! valid_attributes
      delete linker_url(linker)
      expect(response).to redirect_to(linkers_url)
    end
  end
end
