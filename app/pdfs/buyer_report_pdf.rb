class BuyerReportPdf < Prawn::Document
  def initialize(buyer, buyer_activity_types, current_user)
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

    @buyer = buyer
    @buyer_activity_types = buyer_activity_types
    @current_user = current_user
    logo
    header

    current_user.buyer_activity_types.each do |type|
      
      if @buyer.buyer_activities.where(buyer_activity_type_id: type).count > 0
        eval("method_#{type.id}")
      else
      end
    end

    footer
  end

  def logo
    repeat(:all) do
      image "#{Rails.root}/app/assets/logos/logo1.jpg", :height => 75, :at => [450, 745]
    end
  end

  def header
    font "Nunito"
    text "#{@buyer.name.upcase}", size: 15, style: :bold, :color => "60b0f4"
    text "This report documents all activity between #{@buyer.buyer_activities.order(date: :asc).first.date.strftime("%b %d, %Y")} and #{@buyer.buyer_activities.order(date: :asc).last.date.strftime("%b %d, %Y")}."
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

  BuyerActivityType.all.each do |type|
    define_method("method_#{type.id}") do
      move_down 20
      a = [1,
           type.subject_toggle == "Show" ? 1 : nil,
           type.agent_toggle == "Show" ? 1 : nil,
           type.property_address_toggle == "Show" ? 1 : nil,
           type.zipcode_toggle == "Show" ? 1 : nil,
           type.detail_toggle == "Show" ? 1 : nil,
           type.comment_toggle == "Show" ? 1 : nil,
           type.duration_toggle == "Show" ? 1 : nil].compact.length - 1

      font "Nunito"
      text type.title, :align => :left, size: 12, style: :bold
      move_down 5
      table eval("row_#{type.id}"), :position => :center, :width => 540, :column_widths => {0 => 50, 1 => @min_width, a => 60},
                                    :cell_style => {:font => "Nunito", :size => 9} do
        row(0).font_style = :bold
        columns(0..8).align = :center
        self.row_colors = ["F0F0F0", "FFFFFF"]
        self.header = true
      end
    end
  end

  BuyerActivityType.all.each do |type|
    define_method("row_#{type.id}") do
      type.subject_toggle == "Show" ? subject_header = "Subject" : subject_header = nil
      type.agent_toggle == "Show" ? agent_header = "Agent" : agent_header = nil
      type.property_address_toggle == "Show" ? property_address_header = "Property" : property_address_header = nil
      type.zipcode_toggle == "Show" ? zipcode_header = "Zipcode" : zipcode_header = nil
      type.detail_toggle == "Show" ? detail_header = "Detail" : detail_header = nil
      type.comment_toggle == "Show" ? comment_header = "Comment" : comment_header = nil
      type.duration_toggle == "Show" ? duration_header = "Time (min)" : duration_header = nil
      [["Date", subject_header, agent_header, property_address_header, zipcode_header, detail_header, comment_header, duration_header].compact] +
        type.buyer_activities.where(buyer_id: @buyer.id).order(date: :asc).map do |activity|
          [activity.date.strftime("%b %d"),
           type.subject_toggle == "Show" ? activity.subject : nil,
           type.agent_toggle == "Show" ? activity.agent : nil,
           type.property_address_toggle == "Show" ? activity.property_address : nil,
           type.zipcode_toggle == "Show" ? activity.zipcode : nil,
           type.detail_toggle == "Show" ? activity.detail : nil,
           type.comment_toggle == "Show" ? activity.comment: nil,
           type.duration_toggle == "Show" ? activity.duration.to_i : nil].compact
        end
    end
  end
end
