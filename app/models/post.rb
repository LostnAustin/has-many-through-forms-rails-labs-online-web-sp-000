class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories


  def categories_attributes=(categories_attributes)
    category_attributes.each do |category_attribute|
      unless category_attribute[:name].blank?
        category = Category.find_or_create_by(category_attribute)
          self.caegories << category
      end
    end
  end
end
