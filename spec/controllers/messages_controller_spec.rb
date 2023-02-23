require 'rails_helper'

describe MessagesController do
  describe 'GET new' do
    it 'renders a :new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assignes new Message to @message' do
      get :new
      expect(assigns(:message)).to be_a_new(Message)
    end
  end

  describe 'POST create' do
    before { create(:admin) }

    context 'valid data' do
      let(:valid_data) { attributes_for(:message) }

      it 'redirects back to contact' do
        post :create, message: valid_data
        expect(response).to redirect_to(contact_path)
      end
      it 'creates a new message in database' do
        expect { post :create, message: valid_data }.to change(Message, :count).by(1)
      end
    end

    context 'invalid data' do
      let(:invalid_data) { attributes_for(:message, name: '') }

      it 'renders new template' do
        post :create, message: invalid_data
        expect(response).to render_template(:new)
      end

      it 'does not create a new message in database' do
        expect { post :create, message: invalid_data }.not_to change(Message, :count)
      end
    end
  end
end
