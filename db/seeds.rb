# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!(
  [
    {
      email: 'taro@example.com',
      last_name: '日記',
      first_name: '太郎',
      user_name: 'タロウ',
      password: 'password',
      },{
      email: 'jiro@example.com',
      last_name: '愛犬',
      first_name: '次郎',
      user_name: 'ジロウ',
      password: 'password',
      }
  ]
)

my_dogs = MyDog.create!(
  [
    {
      user_id: users[0].id,
      name: 'レオ',
      size: 'small_size_dog',
      birthdate: '2010-07-08',
      dog_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-dog1.jpg"), filename:"sample-dog1.jpg")
    },{
      user_id: users[0].id,
      name: 'リン',
      size: 'medium_size_dog',
      birthdate: '2022-09-08',
      dog_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-dog2.jpg"), filename:"sample-dog2.jpg")
    },{
      user_id: users[1].id,
      name: 'こた',
      size: 'large_scale_dog',
      birthdate: '2020-02-08',
      dog_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-dog3.jpg"), filename:"sample-dog3.jpg")
    }
  ]
)

diaries = Diary.create!(
  [
    {
      user_id: users[0].id,
      my_dog_id: my_dogs[0].id,
      diary_date: '2023年5月8日',
      memo: 'あと2ヶ月でレオの誕生日。そろそろ誕生日プレゼントを買っておこうかな。お菓子かな、、おもちゃかな、、、',
      appetite: 'usually',
      excreta: 'excellent'
    },{
      user_id: users[0].id,
      my_dog_id: my_dogs[0].id,
      diary_date: '2023年5月9日',
      memo: '今日は雨で外に出られない。でもレオは機能の疲れでぐったりだからちょうどいいかな。',
      appetite: 'usually',
      excreta: 'usually'
    },{
      user_id: users[0].id,
      my_dog_id: my_dogs[1].id,
      diary_date: '2023年5月9日',
      memo: '今日は雨で外に出られない。リンちゃんは欲求不満で家の中かけまわってる。怪我しないでね！',
      appetite: 'usually',
      excreta: 'usually'
    },{
      user_id: users[1].id,
      my_dog_id: my_dogs[2].id,
      diary_date: '2023年5月6日',
      memo: '今日はこたのおはようで目が覚めた・・・休みはもう少し寝たいけど、お散歩たくさんしに行こう！',
      appetite: 'excellent',
      excreta: 'usually'
    }
  ]
)

strolls = Stroll.create!(
  [
    {
      user_id: users[0].id,
      my_dog_id: my_dogs[0].id,
      diary_id: diaries[0].id,
      memo: '今日は涼しくて気持ちがいい日だった。レオも楽しそうによく歩いた。',
      start_time: '7:00',
      end_time: '7:40',
      vitality_condition: 'quite_vitality',
    },{
      user_id: users[1].id,
      my_dog_id: my_dogs[2].id,
      diary_id: diaries[3].id,
      memo: '今日は久しぶりのドッグラン。お友達に再会できて、こたもテンションマックス！',
      start_time: '7:00',
      end_time: '8:30',
      vitality_condition: 'quite_vitality',
    }
  ]
)

Pin.create!(
  [
    {
      user_id: users[0].id,
      stroll_id: strolls[0].id,
      title: 'お気に入り',
      latitude: '0.35445728e2',
      longitude: '0.13962378e3',
      distance: '0',
    },{
      user_id: users[0].id,
      stroll_id: strolls[0].id,
      title: 'お気に入り',
      latitude: '0.35446099e2',
      longitude: '0.13962366e3',
      distance: '121',
    },{
      user_id: users[0].id,
      stroll_id: strolls[0].id,
      title: 'お気に入り',
      latitude: '0.35446556e2',
      longitude: '0.139623711e3',
      distance: '100',
    },{
      user_id: users[0].id,
      stroll_id: strolls[0].id,
      title: 'お気に入り',
      latitude: '0.35446479e2',
      longitude: '0.1396234602e3',
      distance: '135',
    },{
      user_id: users[0].id,
      stroll_id: strolls[0].id,
      title: 'お気に入り',
      latitude: '0.354464687e2',
      longitude: '0.1396229666e3',
      distance: '135',
    },{
      user_id: users[0].id,
      stroll_id: strolls[0].id,
      title: 'お気に入り',
      latitude: '0.35445526109e2',
      longitude: '0.1396223465e3',
      distance: '95',
    },{
      user_id: users[0].id,
      stroll_id: strolls[0].id,
      title: 'お気に入り',
      latitude: '0.354450789e2',
      longitude: '0.1396216146e3',
      distance: '150',
    },{
      user_id: users[0].id,
      stroll_id: strolls[0].id,
      title: 'お気に入り',
      latitude: '0.3544500830e2',
      longitude: '0.1396213739e3',
      distance: '150',
    },{
      user_id: users[0].id,
      stroll_id: strolls[0].id,
      title: 'お気に入り',
      latitude: '0.354447180e2',
      longitude: '0.13962067089e3',
      distance: '150',
    },{
      user_id: users[0].id,
      stroll_id: strolls[0].id,
      title: 'お気に入り',
      latitude: '0.3544455579e2',
      longitude: '0.1396206800e3',
      distance: '150',
    },{
      user_id: users[1].id,
      stroll_id: strolls[1].id,
      title: 'お気に入り',
      latitude: '0.35445728e2',
      longitude: '0.13962378e3',
      distance: '0',
    },{
      user_id: users[1].id,
      stroll_id: strolls[1].id,
      title: 'お気に入り',
      latitude: '0.35446099e2',
      longitude: '0.13962366e3',
      distance: '255',
    },{
      user_id: users[1].id,
      stroll_id: strolls[1].id,
      title: 'お気に入り',
      latitude: '0.35446556e2',
      longitude: '0.139623711e3',
      distance: '221',
    },{
      user_id: users[1].id,
      stroll_id: strolls[1].id,
      title: 'お気に入り',
      latitude: '0.35446479e2',
      longitude: '0.1396234602e3',
      distance: '150',
    },{
      user_id: users[1].id,
      stroll_id: strolls[1].id,
      title: 'お気に入り',
      latitude: '0.354464687e2',
      longitude: '0.1396229666e3',
      distance: '261',
    },{
      user_id: users[1].id,
      stroll_id: strolls[1].id,
      title: 'お気に入り',
      latitude: '0.35445526109e2',
      longitude: '0.1396223465e3',
      distance: '170',
    },{
      user_id: users[1].id,
      stroll_id: strolls[1].id,
      title: 'お気に入り',
      latitude: '0.354450789e2',
      longitude: '0.1396216146e3',
      distance: '200',
    },{
      user_id: users[1].id,
      stroll_id: strolls[1].id,
      title: 'お気に入り',
      latitude: '0.3544500830e2',
      longitude: '0.1396213739e3',
      distance: '230',
    },{
      user_id: users[1].id,
      stroll_id: strolls[1].id,
      title: 'お気に入り',
      latitude: '0.354447180e2',
      longitude: '0.13962067089e3',
      distance: '300',
    },{
      user_id: users[1].id,
      stroll_id: strolls[1].id,
      title: 'お気に入り',
      latitude: '0.3544455579e2',
      longitude: '0.1396206800e3',
      distance: '220',
    }
  ]
)
