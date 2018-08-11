module DefaultPageContent
    extend ActiveSupport::Concern

    included do
        before_action :set_page_defaults
    end

    def set_page_defaults
        @page_title = "PhD Thomas A.J. Banyś | Home page"
        @seo_keywords = "law astronomy"
    end
end
