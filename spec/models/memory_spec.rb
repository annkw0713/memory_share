require 'rails_helper'

RSpec.describe Memory, type: :model do
  before do
    @memory = FactoryBot.build(:memory)
  end

  describe '思い出投稿' do
    context '投稿できる場合' do
      it '全ての項目で正しい情報が入力されていれば保存できる' do
        expect(@memory).to be_valid
      end
      it 'movieが空でもそれ以外の項目で正しい情報が入力されていれば保存できる' do
        @memory.movie = ''
        expect(@memory).to be_valid
      end
    end
    context '投稿できない場合' do
      it 'titleが空では保存できない' do
        @memory.title = ''
        @memory.valid?
        expect(@memory.errors.full_messages).to include("Title can't be blank")
      end
      it 'dateが空では保存できない' do
        @memory.date = ''
        @memory.valid?
        expect(@memory.errors.full_messages).to include("Date can't be blank")
      end
      it 'personが空では保存できない' do
        @memory.person = ''
        @memory.valid?
        expect(@memory.errors.full_messages).to include("Person can't be blank")
      end
      it 'placeが空では保存できない' do
        @memory.place = ''
        @memory.valid?
        expect(@memory.errors.full_messages).to include("Place can't be blank")
      end
      it 'descriptionが空では保存できない' do
        @memory.description = ''
        @memory.valid?
        expect(@memory.errors.full_messages).to include("Description can't be blank")
      end
      it 'imagesが空では保存できない' do
        @memory.images = nil
        @memory.valid?
        expect(@memory.errors.full_messages).to include("Images can't be blank")
      end
      it '紐づくユーザーが存在しないと保存できない' do
        @memory.user = nil
        @memory.valid?
        expect(@memory.errors.full_messages).to include('User must exist')
      end
    end
  end
end
