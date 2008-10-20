module AutoBlog
  
  module Filters
    def date_to_string(date)
      date.strftime("%d %b %Y")
    end
    
    def date_to_xmlschema(date)
      date.xmlschema
    end
    
    def xml_escape(input)
      input.gsub("<", "&lt;").gsub(">", "&gt;")
    end
  end
  
end