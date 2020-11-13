require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'User #create' do
    context 'it redirects to user#show when successful' do
      it 'redirects to the user show page' do
        post :create, params: { user: { username: 'Ceci', email: 'cecibenitezca@gmail.com' } }
        expect(response).to redirect_to(user_url(User.find_by(username: 'Ceci', email: 'cecibenitezca@gmail.com')))
      end
    end

    context 'it render to new template when unsuccessful' do
      it 'render new template' do
        post :create, params: { user: { username: '' } }
        expect(response).to render_template(:new)
      end
    end
  end
end
