require 'rails_helper'

describe "User Testing", :type => :request do
    describe 'POST  /register' do
        it 'craete a new users' do
            post '/register', params: {
                email:"testing1@gmail.com",
                fullname:"Testing Satu",
                password:"testingsatu",
                password_confirmation:"testingsatu"
            }

            expect(response).to have_http_status(:created)
        end    
    end

    describe 'POST  /login' do
        it 'login uesr' do
            post '/login', params: {
                email:"testing1@gmail.com",
                password:"testingsatu",
            }

            expect(response).to have_http_status(:success)
        end    
    end    
end