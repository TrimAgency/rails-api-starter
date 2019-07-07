require 'rails_helper'
require 'swagger_helper'

RSpec.describe ConsumersController, type: :request do
  include AuthHelper
  PW_TAG='Password Resets'.freeze

  describe 'Password Reset API', swagger_doc: 'v1/swagger.json' do
    let!(:user_one) { create(:user, :consumer_user) }

    # Run swagger tests using it blocks
    before(:each) do |example|
      submit_request(example.metadata)
    end

    # Build response examples
    after(:each) do |example|
      # Swagger only allows one response block per status code, skip extra tests if needed
      unless example.metadata[:skip_swagger]
        example.metadata[:response][:examples] = 
          { 'application/json' => JSON.parse(response.body, symbolize_names: true) }
      end
    end

    # CREATE
    path '/password_reset' do
      post 'Creates password reset' do
        tags PW_TAG
        consumes 'application/json'
        produces 'application/json'
        security [ Bearer: {} ]
        parameter name: :id, in: :path, type: :string
        parameter name: :password_reset, in: :body, schema: {
          type: :object,
          properties: {
            email: { type: :string }
          }
        }

        let!(:reset_params) { { email: user_one.email } }
        let!(:invalid_params) { { email: 'invalidemail@test.com' } }

        response '201', 'Password reset created' do
          let!(:Authorization) { auth_headers_for(user_one) }
          let!(:id) { user_one.id }
          let!(:password_reset) { reset_params }

          it 'responds with 201 Created' do
            expect(response).to have_http_status :created
          end
          
          it 'returns expected attributes in valid JSON', :skip_swagger do
            expect(response.body).to eql(
              { password_reset: {
                  message: 'password reset sent'
                }
              }.to_json
            )
          end
        end

        response '404', 'User not found' do
          context 'with invalid data' do
            let!(:Authorization) { auth_headers_for(user_one) }
            let!(:id) { user_one.id }
            let!(:password_reset) { invalid_params }

            it 'responds with 404 not found' do
              expect(response).to have_http_status :not_found
            end
          end
        end
      end
    end
  end
end
