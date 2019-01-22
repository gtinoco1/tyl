class ReportPdf < Prawn::Document
    def initialize(property)
        super(top_margin: 70)
        @property = property
        property_address
        line_items
       
    end
    
    def property_address
         text "Report for: #{@property.address.upcase}" , size: 15, style: :bold
    end


    def line_items
        move_down 20
      table call_rows, :cell_style => { :font => "Times-Roman", 
                                            
                                              } do
      row(0).font_style = :bold
      columns(1..3).align = :center
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.header = true
      column(3).width = 60
       column(0).width = 70
     
      end
    end
    
    def call_rows
    [["Date", "Subject", "Contact", "Duration", "Details"]] +
    
    @property.activities.order(date: :desc).map do |activity|
      [activity.date, activity.subject, activity.contact, activity.duration, activity.detail]
      
      end
    end
  
end