class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction non-fiction)}


  validate :clickbait

  def clickbait
    return if self.title == nil
        titles = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        if self.title.include?(titles[0])
            return
        elsif self.title.include?(titles[1])
            return
        elsif self.title.include?(titles[2])
            return
        elsif self.title.include?(titles[3])
            return
        else
            errors.add(:title, "Try harder.")
        end
    end
end
