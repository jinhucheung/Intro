require 'rails_helper'

describe Intro::Admin::ImagesController, type: :controller do
  routes { Intro::Engine.routes }

  let(:image) { Rack::Test::UploadedFile.new('spec/fixtures/ruby.png', 'image/png') }

  context 'unauthorized' do
    it 'should get unauthorized status' do
      post :create, format: :json
      expect(response).to have_http_status(:unauthorized)
    end
  end

  context 'authorized' do
    before do
      session[:intro_admin_authenticated] = Intro.config.admin_username_digest
    end

    after do
      session.delete(:intro_admin_authenticated)
    end

    context '#create' do
      it 'should get bad_request without image' do
        post :create, format: :json
        expect(response).to have_http_status(:bad_request)
      end

      it 'should successfully upload with image' do
        self.class.fixture_path = File.expand_path('../../fixtures', __FILE__)  if self.class.respond_to?(:fixture_path) && !self.class.fixture_path

        post :create, params: { image: image }, format: :json

        expect(response.successful?).to  be true
        expect(json_body[:data]).not_to be_nil
        expect(json_body[:data][:url]).not_to be_nil
      end
    end
  end
end