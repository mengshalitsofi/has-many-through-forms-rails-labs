class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments  

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      if category_attribute[:name] != ""
        category = Category.find_or_create_by(category_attribute)
        self.categories << category
      end
    end
  end

  # def comments_attributes=(comments_attributes)
  #   comments_attributes.values.each do |comments_attributes|
  #     if comments_attributes[:content] != ""
  #       comment = Comment.find_or_create_by(comments_attribute)
  #       self.comments << comment
  #     end
  #   end
  # end
end
