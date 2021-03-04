require 'rails_helper'

RSpec.describe Travel, type: :model do
  describe '動作確認のテスト' do
    before do
      @user = FactoryBot.create(:user)
    end

    it 'Travelを追加' do
      user = @user
      travel = Travel.new(
        user_id: 1,
      )
      expect(travel).to be_valid
    end

    it 'Travelを削除' do
      user = @user
      travel =FactoryBot.create(:travel)
      travel.destroy
      expect{Travel.find(1)}.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end
end