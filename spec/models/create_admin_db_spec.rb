require 'rails_helper'

RSpec.describe "Create users in active record", type: :model do
  before :all do
    User.destroy_all
  end

  context 'if fields all have value and admin role is true' do
    let(:create_user) { User.create!(email: 'micodevacc@gmail.com', password: 'password', password_confirmation: 'password', admin_role: true, approved: true)}

    it 'should create a new admin' do
      expect { create_user }.to change { User.count }.by(1)
    end
  end

  context 'if fields all have value' do
    let(:create_user) { User.create!(email: 'micodevacc@gmail.com', password: 'password', password_confirmation: 'password', approved: true)}

    it 'should create a new user' do
      expect { create_user }.to change { User.count }.by(1)
    end
  end
end
