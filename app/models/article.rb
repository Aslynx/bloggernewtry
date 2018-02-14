class Article < ActiveRecord::Base
   has_many :comments
   has_many :taggings
   has_many :tags, through: :taggings
   has_attached_file :image
   validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
   attr_accessible :title, :body, :tag_list, :view_count

   def tag_list
   	self.tags.collect do |tag|
   		tag.name
   	end.join(", ")
   end

   def tag_list=(tags_string)
   	tag_names = tags_string.split(",").collect{ |s| s.strip.downcase }.uniq
   	new_or_found_tags = tag_names.collect{ |name| Tag.where(name: name).first_or_create }
   	self.tags = new_or_found_tags
   end

   def self.incrementation(article)
      Article.increment_counter(:view_count, article.id)
   end 
end
