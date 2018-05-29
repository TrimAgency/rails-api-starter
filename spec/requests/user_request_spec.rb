require 'rails_helper'

RSpec.describe UsersController, type: :request do
  include AuthHelper

  describe 'post #create' do
    context 'as a consumer' do
      let(:valid_params) do
        {
            user: {
                email: Faker::Internet.email,
                password: '123123123',
                password_confirmation: '123123123',
                profile_type: 'consumer',
                profile: {
                    first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name
                }
            }
        }
      end

      let(:missing_params) do
        {
            user: {
                email: Faker::Internet.email,
                password: '123123123',
                password_confirmation: '123123123',
                profile_type: 'consumer',
                profile: {
                    last_name: Faker::Name.last_name
                }
            }
        }
      end

      let(:invalid_params) do
        {
            user: {
                email: 'not@good',
                password: '123123123',
                password_confirmation: '123123123',
                profile_type: 'consumer',
                profile: {
                    first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name
                }
            }
        }
      end

      context 'with valid user data' do
        before do
          post users_path,
               params: valid_params,
               headers: non_auth_headers,
               as: :json
        end

        it 'responds with 201 Created' do
          expect(response).to have_http_status :created
        end

        it 'successfully creates a user' do
          expect(User.last.email).to eql valid_params[:user][:email]
        end

        it 'returns expected attributes in valid JSON' do
          expect(response.body).to include UserSerializer.new(User.last).attributes.to_json
        end
      end

      context 'with missing user data' do
        before do
          post users_path,
               params: missing_params,
               headers: non_auth_headers,
               as: :json
        end

        it 'responds with 400 Bad Request' do
          expect(response).to have_http_status :bad_request
        end

        it 'responds with errors' do
          expect(response.body).to include 'errors', 'first_name'
        end
      end

      context 'with email that is taken' do
        let(:taken_params) do
          {
              user: {
                  email: 'test@test.com',
                  password: '123123123',
                  password_confirmation: '123123123',
                  profile_type: 'consumer',
                  profile: {
                      first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name
                  }
              }
          }
        end

        before do
          create :user, email: 'test@test.com'

          post users_path,
               params: taken_params,
               headers: non_auth_headers,
               as: :json
        end

        it 'responds with 400 Bad Request' do
          expect(response).to have_http_status :bad_request
        end

        it 'responds with errors' do
          expect(response.body).to include 'errors', 'email'
        end
      end

      context 'with invalid email' do
        before do
          post users_path,
               params: invalid_params,
               headers: non_auth_headers,
               as: :json
        end

        it 'responds with 400 Bad Request' do
          expect(response).to have_http_status :bad_request
        end

        it 'responds with errors' do
          expect(response.body).to include 'errors', 'email'
        end
      end
    end
  end
end