require 'rails_helper'

describe CategoriesController do
  let(:admin) { create(:admin) }

  before { login_as(admin) }

  describe 'GET index' do
    it 'renders :index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'displays list of categories' do
      categories = [create(:category), create(:category)]
      get :index
      expect(assigns(:categories)).to match_array(categories)
    end
  end

  describe 'GET new' do
    it 'renders a :new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assignes new Category to @category' do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end
  end

  describe 'POST create' do
    context 'valid data' do
      let(:valid_data) { attributes_for(:category) }

      it 'redirects to categories#index' do
        post :create, category: valid_data
        expect(response).to redirect_to(categories_path)
      end

      it 'creates new category in database' do
        expect { post :create, category: valid_data }.to change(Category, :count).by(1)
      end
    end

    context 'invalid data' do
      let(:invalid_data) { attributes_for(:category, name: nil) }

      it 'renders a new template' do
        post :create, category: invalid_data
        expect(response).to render_template(:new)
      end

      it 'does not create new category in database' do
        expect { post :create, category: invalid_data }.not_to change(Category, :count)
      end
    end
  end

  describe 'GET edit' do
    let(:category) { create(:category) }

    it 'renders a :edit template' do
      get :edit, id: category
      expect(response).to render_template(:edit)
    end

    it 'assignes requested Category to @category' do
      get :edit, id: category
      expect(assigns(:category)).to eq(category)
    end
  end

  describe 'PUT update' do
    let(:category) { create(:category) }

    context 'valid data' do
      let(:valid_data) { attributes_for(:category, name: 'New name') }

      it 'redirects to categories#index' do
        put :update, id: category, category: valid_data
        expect(response).to redirect_to(categories_path)
      end

      it 'updates category in database' do
        put :update, id: category, category: valid_data
        category.reload
        expect(category.name).to eq('New name')
      end
    end

    context 'invalid data' do
      let(:invalid_data) { attributes_for(:category, name: '') }

      it 'renders edit template' do
        put :update, id: category, category: invalid_data
        expect(response).to render_template(:edit)
      end

      it 'does not update category in database' do
        put :update, id: category, category: invalid_data
        category.reload
        expect(category.name).not_to eq('')
      end
    end
  end

  describe 'DELETE destroy' do
    let(:category) { create(:category) }

    it 'redirects to categories#index' do
      delete :destroy, id: category
      expect(response).to redirect_to(categories_path)
    end

    it 'deletes category from database' do
      delete :destroy, id: category
      expect(Category.exists?(category)).to be_falsy
    end
  end
end
