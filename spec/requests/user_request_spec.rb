require 'rails_helper'
require 'swagger_helper'

RSpec.describe UsersController, type: :request do
  include AuthHelper
  USER_ROOT= 'user'.freeze

  describe 'Users API' do
    let!(:user_one) { create(:user, :consumer_user) }

    path '/users/{id}' do

      get 'Retrieve a user' do
        tags 'Users'
        produces 'application/json'
        security [Bearer: {}]
        parameter name: :id, :in => :path, :type => :string

        response '200', 'user found' do
          let(:"Authorization") { "Bearer #{token_for(user_one)}" }
          schema type: :object,
            properties: {
              id: { type: :integer },
              email: { type: :string },
              profile_type: { type: :string }
            }

          let(:id) { user_one.id }
          run_test!
        end

        response '401', 'unauthorized' do
          let(:"Authorization") { "Bearer " }
          let(:id) { user_one.id }
          run_test!
        end
      end
    end
  end

  # describe 'get #show' do
  #   context 'as a consumer' do
  #     let!(:user_one) { create(:user, :consumer_user) }

  #     let!(:user_two) { create(:user, :consumer_user) }

  #     context 'logged in' do
  #       context 'accessing their information' do
  #         before do
  #           get user_path(user_one),
  #               headers: auth_headers_for(user_one),
  #               as: :json
  #         end

  #         it 'responds with 200 OK' do
  #           expect(response).to have_http_status :ok
  #         end

  #         it 'returns expected attributes in valid JSON' do
  #           expect(response.body).to eql({ user: UserSerializer.new(user_one).attributes }.to_json)
  #         end
  #       end

  #       context 'accessing another users information' do
  #         before do
  #           get user_path(user_two),
  #               headers: auth_headers_for(user_one),
  #               as: :json
  #         end

  #         it 'responds with 401 Unauthorized' do
  #           expect(response).to have_http_status :unauthorized
  #         end
  #       end

  #     end

  #     context 'logged out' do
  #       context 'accessing any users information' do
  #         before do
  #           get user_path(user_one),
  #               headers: non_auth_headers,
  #               as: :json
  #         end

  #         it 'responds with 401 Unauthorized' do
  #           expect(response).to have_http_status :unauthorized
  #         end
  #       end
  #     end
  #   end
  # end

  # describe 'post #create' do
  #   context 'as a consumer' do
  #     let(:valid_params) do
  #       { 
  #         email: Faker::Internet.email,
  #         password: '123123123',
  #         password_confirmation: '123123123',
  #         profile_type: 'consumer',
  #         profile: {
  #             first_name: Faker::Name.first_name,
  #             last_name: Faker::Name.last_name
  #         }
  #       }
  #     end

  #     let(:missing_params) do
  #       {
  #         email: Faker::Internet.email,
  #         password: '123123123',
  #         password_confirmation: '123123123',
  #         profile_type: 'consumer',
  #         profile: {
  #             last_name: Faker::Name.last_name
  #         }
  #       }
  #     end

  #     let(:invalid_params) do
  #       {
  #         email: 'not@good',
  #         password: '123123123',
  #         password_confirmation: '123123123',
  #         profile_type: 'consumer',
  #         profile: {
  #             first_name: Faker::Name.first_name,
  #             last_name: Faker::Name.last_name
  #         }
  #       }
  #     end

  #     context 'with valid user data' do
  #       before do
  #         post users_path,
  #              params: valid_params,
  #              headers: non_auth_headers,
  #              as: :json
  #       end

  #       it 'responds with 201 Created' do
  #         expect(response).to have_http_status :created
  #       end

  #       it 'successfully creates a user' do
  #         expect(User.last.email).to eql valid_params[:email]
  #       end

  #       it 'returns expected attributes in valid JSON' do
  #         expect(response.body).to include UserSerializer.new(User.last).attributes.to_json
  #       end
  #     end

  #     context 'with missing user data' do
  #       before do
  #         post users_path,
  #              params: missing_params,
  #              headers: non_auth_headers,
  #              as: :json
  #       end

  #       it 'responds with 400 Bad Request' do
  #         expect(response).to have_http_status :bad_request
  #       end

  #       it 'responds with errors' do
  #         expect(response.body).to include 'errors', 'first_name'
  #       end
  #     end

  #     context 'with email that is taken' do
  #       let(:taken_params) do
  #         {
  #           email: 'test@test.com',
  #           password: '123123123',
  #           password_confirmation: '123123123',
  #           profile_type: 'consumer',
  #           profile: {
  #               first_name: Faker::Name.first_name,
  #               last_name: Faker::Name.last_name
  #           }
  #         }
  #       end

  #       before do
  #         create :user, email: 'test@test.com'

  #         post users_path,
  #              params: taken_params,
  #              headers: non_auth_headers,
  #              as: :json
  #       end

  #       it 'responds with 400 Bad Request' do
  #         expect(response).to have_http_status :bad_request
  #       end

  #       it 'responds with errors' do
  #         expect(response.body).to include 'errors', 'email'
  #       end
  #     end

  #     context 'with invalid email' do
  #       before do
  #         post users_path,
  #              params: invalid_params,
  #              headers: non_auth_headers,
  #              as: :json
  #       end

  #       it 'responds with 400 Bad Request' do
  #         expect(response).to have_http_status :bad_request
  #       end

  #       it 'responds with errors' do
  #         expect(response.body).to include 'errors', 'email'
  #       end
  #     end
  #   end
  # end

  # describe 'patch #update' do
  #   context 'as a consumer' do
  #     let!(:user_one) { create(:user, :consumer_user) }

  #     let!(:user_two) { create(:user, :consumer_user) }

  #     let(:update_params) do
  #       { 
  #         email: 'newemail@test.com' 
  #       }
  #     end

  #     context 'logged in' do
  #       context 'updating their information' do
  #         before do
  #           patch user_path(user_one),
  #                 params: update_params,
  #                 headers: auth_headers_for(user_one),
  #                 as: :json
  #         end

  #         it 'responds with 200 OK' do
  #           expect(response).to have_http_status :ok
  #         end

  #         it 'updates the record' do
  #           expect(User.find(user_one.id).email).to eql 'newemail@test.com'
  #         end

  #         it 'returns expected attributes in valid JSON' do
  #           expect(response.body).to eql({ user: UserSerializer.new(User.find(user_one.id)).attributes }.to_json)
  #         end
  #       end
  #     end

  #     context 'logged in' do
  #       context 'updating another users information' do
  #         before do
  #           patch user_path(user_two),
  #                 params: update_params,
  #                 headers: auth_headers_for(user_one),
  #                 as: :json
  #         end

  #         it 'responds with 401 Unauthorized' do
  #           expect(response).to have_http_status :unauthorized
  #         end
  #       end
  #     end
  #   end
  # end
end