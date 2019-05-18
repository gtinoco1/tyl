class ReportByDatePdf < Prawn::Document
  def initialize(property, current_user, start_date, end_date, subject_check, contact_check, duration_check, cost_check)
    super(top_margin: 50)

    font_families.update("Nunito" => {:normal => Rails.root.join("app/assets/fonts/Nunito-Regular.ttf"),
                                      :italic => Rails.root.join("app/assets/fonts/Nunito-Italic.ttf"),
                                      :bold => Rails.root.join("app/assets/fonts/Nunito-Bold.ttf"),
                                      :bold_italic => Rails.root.join("app/assets/fonts/Nunito-BoldItalic.ttf")})

    @property = property
    @current_user = current_user
    @start_date = start_date
    @end_date = end_date
    @subject_check = subject_check
    @contact_check = contact_check
    @duration_check = duration_check
    @cost_check = cost_check

    logo
    header
    move_down 10
    new_table
    footer
  end

  def logo
    repeat([1]) do
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


    if @duration_check == "" and @cost_check == ""
      a = 10
    elsif
        a = 1 + [@subject_check, @contact_check,  @duration_check, @cost_check ].count { |toggle| toggle == "on" }
    end
  
    table rows_by_date, position: :center, width: 540,
                        column_widths: {0 => 50, 1 => @min_width, a => 50},
                        cell_style: {font: "Nunito", size: 9} do
      row(0).font_style = :bold
      columns(0..8).align = :center
      self.row_colors = ["F0F0F0", "FFFFFF"]
      self.header = true
    end
  end

  def rows_by_date
    @subject_check == "on" ? subject_header = "Subject/Details" : subject_header = nil
    @contact_check == "on" ? contact_header = "Contact" : contact_header = nil
    @duration_check == "on" ? duration_header = "Duration" : duration_header = nil
    @cost_check == "on" ? cost_header = "Cost" : cost_header = nil

    [["Date", "Activity", subject_header, contact_header, cost_header, duration_header].compact] +
      @property.activities.order(date: :asc).where(:date => (@start_date..@end_date)).map do |activity|
        [activity.date.strftime("%b %d"),
         activity.activity_type.title,
         @subject_check == "on" ? activity.subject + "\n" + activity.detail + "\n" + activity.outcome : nil,
         @contact_check == "on" ? activity.contact + "\n" + activity.agent + "\n" + activity.customer : nil,
         @cost_check == "on" ? activity.cost.to_i : nil,
         @duration_check == "on" ? activity.duration.to_i : nil].compact
      end
  end
end
