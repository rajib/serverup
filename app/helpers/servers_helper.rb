module ServersHelper
	def colourize_status(status)
		if status == "up"
			content_tag(:span, "UP", class: "label label-success")
		elsif status == "down"
			content_tag(:span, "DOWN", class: "label label-important")
		else
			content_tag(:span, "ERROR", class: "label label-inverse")
		end
	end
end
