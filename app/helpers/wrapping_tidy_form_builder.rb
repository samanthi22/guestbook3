class WrappingTidyFormBuilder < ActionView::Helpers::FormBuilder

    def label_for(method, options={})
       label = label(options.delete(:label) || method)
       if options[:required]
           label.safe_concat(" <span class='required_mark'>*</span>")
       end
       label.safe_concat("<br />")
   end

    private
    def wrap_field(text, options={})
       field_class = "field"
       if options[:required]
           field_class = "field required"
       end
       "<div class='#{field_class}'>".html_safe.safe_concat(text).safe_concat("</div>")
   end
   
 end