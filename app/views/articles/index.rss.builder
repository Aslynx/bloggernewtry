xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
	xml.channel do
		xml.title "My Blogger"
		xml.description "This is Blogger made by me"
		xml.link root_url

		@articles.each do |article|
			xml.item do
				xml.title article.title
				xml.description article.body
				xml.pudDate article.created_at.to_s(:rfc822)
				xml.link article_url(article)
				xml.guid article_url(article)
			end
		end
	end
end