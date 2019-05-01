class ReportTwoPdf < Prawn::Document
  def initialize(property, current_user, start_date, end_date)
    super(top_margin: 50)

    font_families.update("Krub" => {
                           :normal => Rails.root.join("app/assets/fonts/Krub-Regular.ttf"),
                           :italic => Rails.root.join("app/assets/fonts/Krub-Italic.ttf"),
                           :bold => Rails.root.join("app/assets/fonts/Krub-Bold.ttf"),
                           :bold_italic => Rails.root.join("app/assets/fonts/Krub-BoldItalic.ttf"),
                         })

    font_families.update("Nunito" => {
                           :normal => Rails.root.join("app/assets/fonts/Nunito-Regular.ttf"),
                           :italic => Rails.root.join("app/assets/fonts/Nunito-Italic.ttf"),
                           :bold => Rails.root.join("app/assets/fonts/Nunito-Bold.ttf"),
                           :bold_italic => Rails.root.join("app/assets/fonts/Nunito-BoldItalic.ttf"),
                         })

    @property = property
    @current_user = current_user
    @start_date = start_date
    @end_date = end_date
    logo
    header

    # @activity_types.each do |type|
    # eval("test_#{type.id}")
    # end


    current_user.activity_types.each do |type|
      if @property.activities.where(activity_type_id: type.id).where(:date => (@start_date..@end_date)).count > 0
        eval("method_#{type.id}")
      else
      end
    end

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

  def set_width_constraints
    @min_width ||= padding_left + padding_right
    @max_width ||= @pdf.bounds.width
  end

  ActivityType.all.each do |type|
    define_method("method_#{type.id}") do
      move_down 20
      a = [1,
           type.subject_toggle == "Show" ? 1 : nil,
           type.contact_toggle == "Show" ? 1 : nil,
           type.agent_toggle == "Show" ? 1 : nil,
           type.customer_toggle == "Show" ? 1 : nil,
           type.detail_toggle == "Show" ? 1 : nil,
           type.outcome_toggle == "Show" ? 1 : nil,
           type.cost_toggle == "Show" ? 1 : nil,
           type.duration_toggle == "Show" ? 1 : nil].compact.length - 1

      font "Nunito"
      text type.title, :align => :left, size: 12, style: :bold
      move_down 5
      table eval("row_#{type.id}"), :position => :center, :width => 540, :column_widths => {0 => 50,1 => @min_width, a => 60},
                                    :cell_style => {:font => "Nunito", :size => 9} do
        row(0).font_style = :bold
        columns(0..8).align = :center
        self.row_colors = ["F0F0F0", "FFFFFF"]
        self.header = true
      end
    end
  end

  ActivityType.all.each do |type|
    define_method("row_#{type.id}") do
      type.subject_toggle == "Show" ? subject_header = "Subject" : subject_header = nil
      type.contact_toggle == "Show" ? contact_header = "Contact" : contact_header = nil
      type.agent_toggle == "Show" ? agent_header = "Agent" : agent_header = nil
      type.customer_toggle == "Show" ? customer_header = "Customer" : customer_header = nil
      type.detail_toggle == "Show" ? detail_header = "Detail" : detail_header = nil
      type.outcome_toggle == "Show" ? outcome_header = "Outcome" : outcome_header = nil
      type.cost_toggle == "Show" ? cost_header = "Cost" : cost_header = nil
      type.duration_toggle == "Show" ? duration_header = "Time (min)" : duration_header = nil
      [["Date", subject_header, contact_header, agent_header, customer_header, detail_header, outcome_header, cost_header, duration_header].compact] +
        type.activities.where(property_id: @property.id).order(date: :asc).where(:date => (@start_date..@end_date)).map do |activity|
          [activity.date.strftime("%b %d"),
           type.subject_toggle == "Show" ? activity.subject : nil,
           type.contact_toggle == "Show" ? activity.contact : nil,
           type.agent_toggle == "Show" ? activity.agent : nil,
           type.customer_toggle == "Show" ? activity.customer : nil,
           type.detail_toggle == "Show" ? activity.detail : nil,
           type.outcome_toggle == "Show" ? activity.outcome : nil,
           type.cost_toggle == "Show" ? activity.cost.to_i : nil,
           type.duration_toggle == "Show" ? activity.duration.to_i : nil].compact
        end
    end
  end
end
