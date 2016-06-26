class Article <ActiveRecord::Base
validates :title, presence: {message:"pehle se hai"},length:{ minimum:3, maximum:20 }
validates :description, presence: true,length:{ minimum:3, maximum:20 }
end 