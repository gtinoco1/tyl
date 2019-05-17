class ReportByDatePdf < Prawn::Document
  def initialize(property, current_user, start_date, end_date)
    super(top_margin: 50)

    font_families.update("Nunito" => {  :normal => Rails.root.join("app/assets/fonts/Nunito-Regular.ttf"),
                                        :italic => Rails.root.join("app/assets/fonts/Nunito-Italic.ttf"),
                                        :bold => Rails.root.join("app/assets/fonts/Nunito-Bold.ttf"),
                                        :bold_italic => Rails.root.join("app/assets/fonts/Nunito-BoldItalic.ttf") })

    @property = property
    @current_user = current_user
    @start_date = start_date
    @end_date = end_date
    
    logo
    header
    move_down 10
    new_table
    footer
    
  end
  
   def logo
    repeat([1])  do
      image "#{Rails.root}/app/assets/logos/logo1.jpg", :height => 75, :at => [450, 745]
    end
   end

  def header
    font "Nunito"
    text "#{@property.address.upcase}", size: 15, style: :bold, :color => "60b0f4"
    text "This report documents all activity between #{@start_date.strftime("%b %d, %Y")} and #{@end_date.strftime("%b %d, %Y")}."
    stroke do
      horizontal_rule
    end
  end
  
  def footer
      repeat(:all, :dynamic => true) do
      draw_text page_number, :at => [530, 0]
    end
  end

  def new_table
    font "Nunito"

    move_down 5

    table rows_by_date, position: :center, width: 540,
                                  column_widths: {0 => 50, 1 => @min_width, 3 => 60},
                                  cell_style: {font: "Nunito", size: 9} do
      row(0).font_style = :bold
      columns(0..8).align = :center
      self.row_colors = ["F0F0F0", "FFFFFF"]
      self.header = true
    end
  
  end
  
  def rows_by_date
    
      # type.subject_toggle == "Show" ? subject_header = "Subject" : subject_header = nil
  
      [["Date", "Activity", "Subject", "Contact", "Agent", "Customer", "Detail", "Cost", "Duration"].compact] +
        @property.activities.order(date: :asc).where(:date => (@start_date..@end_date)).map do |activity|
          [activity.date.strftime("%b %d"),
          activity.activity_type.title,
           activity.subject,
           activity.contact,
           activity.agent,
           activity.customer,
           "#{activity.detail} #{activity.outcome}",
           activity.cost.to_i,
          # type.cost_toggle == "Show" ? activity.cost.to_i : nil,
           activity.duration.to_i].compact
      end  
  end

end
