class WrappingTidyFormBuilder < ActionView::Helpers::FormBuilder
    def country_select(method, options={}, html_options={})
       select(method, [["Canada", "Canada"],
       ["Mexico", "Mexico"],
       ["United Kingdom", "UK"],
       ["United States of America", "USA"]],
       options, html_options)
   end
   
   def text_field(method, option={})
       wrap_field(label = label_for(method, options) + super(method, options), option)
   end
   
    def time_select(method, options={}, html_options = {})
       wrap_field(label = label_for(method, options) + super(method, options, html_options))
   end
   
   def select(method, choices, options={}, html_options = {})
       wrap_field(label_for(method, options) + super(method, choices, options, html_options))
   end
   
   
   def check_box(method, options={}, checked_value = "1", unchecked_value = "0")
       label_for(method, options) + super(method, options, checked_value, unchecked_value)
   end
   
   
   private
   def label_for(method, options={})
       label = label(options.delete(:label) || method)
       if options[:required]
           label.safe_concat(" <span class='required_mark'>*</span>")
       end
       label.safe_concat("<br />")
   end
   
   def wrap_field(text, options={})
       field_class = "field"
       if options[:required]
           field_class = "field required"
       end
       "<div class='#{field_class}'>".html_safe.safe_concat(text).safe_concat("</div>")
   end
   
    
end





class WrappingTidyFormBuilder < ActionView::Helpers::FormBuilder

    def label_for(method, options={})
       label = label(options.delete(:label) || method)
       if options[:required]
           label.safe_concat(" <span class='required_mark'>*</span>")
       end
       label.safe_concat("<br />")
   end
    
   
 end