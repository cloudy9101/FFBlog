module ApplicationHelper
	def full_title(page_title)
		if !page_title.nil?
			"#{page_title} | FFBLOG"
		else
			"FFBLOG"
		end
	end
end
