module ApplicationHelper
	def build_title(title)
		base = "Sample Application"
		if title.empty?
			return base
		end
		return "#{base} | #{title}"
	end
end
