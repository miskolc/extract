class StaticPagesController < ApplicationController
  include ApplicationHelper
  require 'open-uri'
  def home
    link = params[:link] 
    if !link.nil?
        if !link.empty?
            # link_to_id extracts the id or returns nil if there is no id 
            id= link_to_id(link)
            if !id.nil?
                    val = ""

                    # Building the GDATA URI and extracting the XML
                    query = "http://gdata.youtube.com/feeds/api/videos?q=" + id
                    open(query) { |f| 
                        f.each_line { |line| val = val + line }
                    }

                    # If there are 0 results in the GDATA API then there is no video
                    not_found = val.scan('totalResults>0<')
                    if not_found.empty?
                            flash.now[:success] = "Youtube video was found!"
                        else 
                            flash.now[:error] = "Youtube video not found!" 
                    end        
            else 
                    flash.now[:notification] = "Please type a Youtube link"        
            end
        end
    end         
  end
end
