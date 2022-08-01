class Post < ApplicationRecord
  validate :clickbait

  validates :title , presence: true
  validates :content , length: {minimum: 250}
  validates :summary , length: { in: 0..250}
  validates :category , inclusion: ["Fiction" , "Non-Fiction"]


  def clickbait
    valid_arr = [/(Won't Believe)/ , /(Secret)/ , /(Top )+[0-9]/ ,/(Guess)/]
    res = valid_arr.filter {|regex| regex.match(title)}
    if res.empty?
      errors.add(:title , "Not Clickbait-y enough")
    end
  end
end
