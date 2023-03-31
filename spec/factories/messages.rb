FactoryBot.define do
  factory :message do
    content{Faker::Lorem.sentence}
    association :user
    association :room

    after(:build) do |message| #インスタンス生成=:build後に行う
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      #アップロードされたファイルをattachでActiveStorageで扱えるように→モデルのインスタンスに画像を添付
    end  
  end
end