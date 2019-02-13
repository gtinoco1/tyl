class ReportTwoPdf < Prawn::Document
  def initialize(property, activity_types, current_user)
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
    @activity_types = activity_types
    @current_user = current_user
    logo
    header

    # @activity_types.each do |type|
    # eval("test_#{type.id}")
    # end

    @activity_types.each do |type|
      eval("method_#{type.id}")
    end

    footer
  end

  # def test
  #   @activity_types.each do |type|
  #   text type.title
  # end
  # end

  ActivityType.all.each do |type|
    define_method("test_#{type.id}") do
      text type.title
    end
  end

  def logo
    repeat(:all) do
      image "#{Rails.root}/app/assets/logos/logo1.jpg", :height => 75, :at => [450, 745]
    end
  end

  def header
    font "Nunito"
    text "#{@property.address.upcase}", size: 15, style: :bold, :color => "60b0f4"
    text "This report documents all activity between #{@property.activities.order(date: :asc).first.date.strftime("%b %d, %Y")} and #{@property.activities.order(date: :asc).last.date.strftime("%b %d, %Y")}."
    stroke do
      horizontal_rule
    end
  end

  def footer
    repeat(:all, :dynamic => true) do
      draw_text page_number, :at => [530, 0]
    end
  end

  ActivityType.all.each do |type|
    define_method("method_#{type.id}") do
      move_down 20
      font "Nunito"
      text type.title, :align => :left, size: 13, style: :bold
      move_down 5
      table eval("rows_#{type.id}"), :position => :center, :width => 540, :column_widths => {0 => 50, 3 => 60},
                                     :cell_style => {:font => "Nunito", :size => 10} do
        row(0).font_style = :bold
        columns(0..3).align = :center
        self.row_colors = ["F0F0F0", "FFFFFF"]
        self.header = true
      end
    end
  end

  ActivityType.all.each do |type|
    define_method("rows_#{type.id}") do
      [["Date", "Contact", "Details", "Time (min)"]] +
        type.activities.order(date: :desc).map do |activity|
          [activity.date.strftime("%b %d"), activity.contact, activity.detail, activity.duration.to_i]
        end
    end
  end
end
