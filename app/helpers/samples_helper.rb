module SamplesHelper

  def calendar_options                                        
    prevd = @display_date - 1
    nextd = @display_date + 31
    {       
      :year => @display_date.year,
      :month => @display_date.month,
      :previous_month_text =>
        link_to("&lt;&lt; Prev",
          :year => prevd.year, :month => prevd.month),                                               
      :next_month_text =>                                     
        link_to("Next &gt;&gt;",
          :year => nextd.year, :month => nextd.month)
    }                                                         
  end
  
end
