require 'rails_helper'

RSpec.describe Travel, type: :model do
  describe '動作確認のテスト' do
    before do
      @user = Travel.create(:user)
    end

    it 'Travelを追加' do
      user = @user
      Travel = Travel.new(
        user_id: 1,
        name: "test",
      )
      expect(Travel).to be_valid
    end

    it 'Travelを削除' do
      user = @user
      travel =FactoryBot.create(:travel)
      travel.destroy
      expect{Travel.find(1)}.to raise_exception(ActiveRecord::RecordNotFound)
    end

  end

  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:user)
    end

    it 'titleが空の場合保存されない' do
      user = @user
      todo = Todo.new(
        user_id: 1,
        title: "",
        point: 1,
      )
      todo.valid?
      expect(todo.errors[:title]).to include("を入力してください")
    end

    it 'titleが20文字の以上の場合保存されない' do
      user = @user
      todo = Todo.new(
        user_id: 1,
        title: "テストテストテストテストテストテストテストテストテストテスト",
        point: 1,
      )
      todo.valid?
      expect(todo.errors[:title]).to include("は20文字以内で入力してください")
    end

    it 'pointが空の場合保存されない' do
      user = @user
      todo = Todo.new(
        user_id: 1,
        title: "テスト",
        point: "",
      )
      todo.valid?
      expect(todo.errors[:point]).to include("を入力してください")
    end

  end
end