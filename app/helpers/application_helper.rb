module ApplicationHelper

    def link_to_id( link )
        if link.nil?
            link=""
        end    
       length=link.length-1
       a=nil
       (1..length).map do |i|
           if link[i]=='=' && link[i-1]=='v' 
              a=i+1
           end
           break if !a.nil?
         end
        
        # if the link does have a the substring 'v='
        # and there are at least 11 chars after it return the YT id
        
        if !a.nil? && a+10 <= length
            link[a..a+10]
        else 
            nil
        end        

    end
end
