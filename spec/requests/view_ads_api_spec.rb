require 'rails_helper'

describe 'API visualização de anúncios' do
  context 'GET /api/v1/ads' do
    it '402 caso nao tenham anuncios cadastrados' do
      get '/api/v1/ads'

      expect(response).to have_http_status 204
      expect(response.body).to empty
    end
  end
end