require 'rails_helper'

describe V1::TravelsController , type: :request do

  describe 'POST #create' do
    context 'パラメーターが妥当な場合' do
      it 'リクエストが成功する' do
        post v1_travels_path, params: { travel: FactoryBot.attributes_for(:travel) }
          expect(response.status).to eq 201
      end

      it 'Travelが登録される' do
        expect do
          post v1_travels_path, params: { travel: FactoryBot.attributes_for(:travel) }
        end.to change(Travel, :count).by(1)
      end
    end

    context 'パラメーターが不正な場合' do
      it 'リクエストが成功する' do
        post v1_travels_path, params: { travel: FactoryBot.attributes_for(:travel, :invalid) }
          expect(response.status).to eq 422
      end

      it 'Travelが登録されないこと' do
        expect do
          post v1_travels_path, params: { travel: FactoryBot.attributes_for(:travel, :invalid) }
        end.to_not change(Travel, :count)
      end

    end
  end

  describe 'PATCH #update' do
      let!(:travel){ create(:travel) }
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        patch v1_travel_path(id: 1), params: { id:1, travel: FactoryBot.attributes_for(:travel)}
        expect(response.status).to eq 200
      end

      it 'タイトルが更新されること' do
        expect do
          patch v1_travel_path(id: 1), params: { id:1, travel: FactoryBot.attributes_for(:travel_changed) }
        end.to change { Travel.find(1).title }.from('test').to('changed')
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        patch v1_travel_path(id: 1), params: { id:1, travel: FactoryBot.attributes_for(:travel_changed, :invalid) }
        expect(response.status).to eq 422
      end

      it 'タイトルが変更されないこと' do
        expect do
          patch v1_travel_path(id: 1), params: { id:1, travel: FactoryBot.attributes_for(:travel, :invalid) }
        end.to_not change(Travel.find(1), :title)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:travel) { FactoryBot.create :travel }

    it 'リクエストが成功すること' do
      delete v1_travel_path(id: 1)
      expect(response.status).to eq 200
    end

    it 'ユーザーが削除されること' do
      expect do
        delete v1_travel_path(id: 1)
      end.to change(Travel, :count).by(-1)
    end

  end
end