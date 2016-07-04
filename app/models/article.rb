class Article <ActiveRecord::Base
  belongs_to :user
validates :title, presence: {message:"pehle se hai"},length:{ minimum:3, maximum:20 }
validates :description, presence: true,length:{ minimum:3, maximum:20 }
validates :user_id,presence: true
end 