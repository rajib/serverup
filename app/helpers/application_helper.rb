module ApplicationHelper
	def nav_class(path, _controller=false)
	  if _controller
	    controller.controller_name == _controller ? "active" : ""
	  else
	    current_page?(path) ? "active" : ""
	  end
	end

	def title(page_title)
		content_for(:title) { page_title }
	end
end
