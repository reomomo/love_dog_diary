class DogDiary < ApplicationRecord

    enum appetite: {
    a_little: 0, # 少ない
    slightly_less: 1, # やや少ない
    usually: 2, # 普通
    good: 3, # やや多い
    excellent: 4, # 多い
  }, _prefix: true

  enum excreta: {
    a_little: 0, # 少ない
    slightly_less: 1, # やや少ない
    usually: 2, # 普通
    good: 3, # やや多い
    excellent: 4, # 多い
  }, _suffix: true

  belongs_to :diary
  belongs_to :my_dog

  def dog_age
    (Date.today.strftime("%Y%m%d").to_i - current_user.my_dog.birthdate.strftime("%Y%m%d").to_i)/10000
  end

  # def dog_human_age
  #   if MyDog.size == large_scale_dog && dog_age <= 1
  #     dog_age
  #   else

  #   end
  # end
end
