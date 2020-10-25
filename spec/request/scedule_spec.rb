require 'rails_helper'
describe "Scedule API", :type => :request do
    describe 'GET  /scedules' do
        it 'get all scedules' do
            get '/register'
            expect(response).to have_http_status(:success)
        end    
    end

    describe 'POST  /book_scedule' do
        it 'book_scedule' do
            describe 'POST  /book_scedule' do
                it 'login uesr' do
                    post '/book_scedule', params: {
                        user_id:1,
                        scedule_id:1,
                    }        
                    expect(response).to have_http_status(:created)
                end    
            end   
            
        end    
    end
end