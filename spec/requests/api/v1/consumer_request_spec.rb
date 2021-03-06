require 'rails_helper'
require 'swagger_helper'

RSpec.describe Api::V1::ConsumersController, type: :request do
  include AuthHelper
  CONSUMER_ROOT = 'consumer'.freeze
  CONSUMER_TAG = 'Consumers'.freeze

  describe 'Consumers API', swagger_doc: 'v1/swagger.json' do
    let!(:user_one) { create(:user, :consumer_user) }
    let!(:user_two) { create(:user, :consumer_user) }

    # UPDATE
    path '/api/v1/consumers/{id}' do
      patch 'Updates a consumer' do
        tags CONSUMER_TAG
        consumes 'application/json'
        produces 'application/json'
        security [Bearer: []]
        parameter name: :id, in: :path, type: :string
        parameter name: :consumer, in: :body, schema: {
          type: :object,
          properties: {
            first_name: { type: :string },
            last_name: { type: :string }
          }
        }

        let!(:update_params) { { first_name: 'Mary' } }

        response '200', 'Consumer updated' do
          let!(:Authorization) { auth_headers_for(user_one) }
          schema '$ref' => '#/definitions/consumer'

          let!(:id) { user_one.profile.id }
          let!(:consumer) { update_params }

          it 'responds with 200 OK', request_example: :consumer do
            expect(response).to have_http_status :ok
          end

          it 'updates the record', :skip_swagger do
            expect(User.find(user_one.id).profile.first_name).to eql 'Mary'
          end

          it 'returns expected attributes in valid JSON', :skip_swagger do
            user = User.find(user_one.id)
            expect(response.body).to eql(
              ConsumerSerializer.render(user.profile, root: CONSUMER_ROOT)
            )
          end
        end

        response '401', 'Unauthorized' do
          context 'when updating another user\'s profile data' do
            let!(:Authorization) { auth_headers_for(user_two) }
            let!(:id) { user_one.profile.id }
            let!(:consumer) { update_params }

            it 'responds with 401 unauthorized' do
              expect(response).to have_http_status :unauthorized
            end
          end
        end
      end
    end
  end
end
