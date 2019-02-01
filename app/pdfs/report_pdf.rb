class ReportPdf < Prawn::Document
  def initialize(property, activity_types)
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
    logo
    header
    tables
    footer
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

  def call_table
    move_down 20
    font "Nunito"
    text "Calls", :align => :left, size: 13, style: :bold
    move_down 5
    table call_rows, :position => :center, :width => 540, :column_widths => {0 => 50, 3 => 60},
                     :cell_style => {:font => "Nunito", :size => 10} do
      row(0).font_style = :bold
      columns(0..3).align = :center
      self.row_colors = ["F0F0F0", "FFFFFF"]
      self.header = true
    end
  end

  def showing_table
    move_down 20
    font "Nunito"
    text "Showings", :align => :left, size: 13, style: :bold
    move_down 5
    table showing_rows, :position => :center, :width => 540, :column_widths => {0 => 50, 4 => 60},
                        :cell_style => {:size => 10} do
      row(0).font_style = :bold
      columns(0..4).align = :center
      self.row_colors = ["F0F0F0", "FFFFFF"]
      self.header = true
    end
  end

  def listing_agreement_table
    move_down 20
    font "Nunito"
    text "Listing Agreement Paperwork", :align => :left, size: 13, style: :bold
    move_down 5
    table listing_agreement_rows, :position => :center, :width => 540, :column_widths => {0 => 50, 2 => 60},
                                  :cell_style => {:size => 10} do
      row(0).font_style = :bold
      columns(0..3).align = :center
      self.row_colors = ["F0F0F0", "FFFFFF"]
      self.header = true
    end
  end

  def other_table
    move_down 20
    font "Nunito"
    text "Other", :align => :left, size: 13, style: :bold
    move_down 5
    table other_rows, :position => :center, :width => 540, :column_widths => {0 => 50, 2 => 60},
                                  :cell_style => {:size => 10} do
      row(0).font_style = :bold
      columns(0..3).align = :center
      self.row_colors = ["F0F0F0", "FFFFFF"]
      self.header = true
    end
  end

  def call_rows
    [["Date", "Contact", "Details", "Time (min)"]] +
    @property.activities.where(activity_type: @activity_types.where(title: "Call").first.id).order(date: :desc).map do |activity|
      [activity.date.strftime("%b %d"), activity.contact, activity.detail, activity.duration.to_i]
    end
  end

  def showing_rows
    [["Date", "Agent", "Customer", "Details", "Time (min)"]] +
    @property.activities.where(activity_type: @activity_types.where(title: "Showing").first.id).order(date: :desc).map do |activity|
      [activity.date.strftime("%b %d"), activity.agent, activity.customer, activity.detail, activity.duration.to_i]
    end
  end

  def listing_agreement_rows
    [["Date", "Details", "Time (min)"]] +
    @property.activities.where(activity_type: @activity_types.where(title: "Listing Agreement Paperwork").first.id).order(date: :desc).map do |activity|
      [activity.date.strftime("%b %d"), activity.detail, activity.duration.to_i]
    end
  end
  
  def other_rows
    [["Date", "Details", "Time (min)"]] +
    @property.activities.where(activity_type: @activity_types.where(title: "Other").first.id).order(date: :desc).map do |activity|
      [activity.date.strftime("%b %d"), activity.detail, activity.duration.to_i]
    end
  end

  def tables
    if @property.activities.where(activity_type: @activity_types.where(title: "Showing").first.id).count > 0
      showing_table
    else
    end

    if @property.activities.where(activity_type: @activity_types.where(title: "Call").first.id).count > 0
      call_table
    else
    end

    if @property.activities.where(activity_type: @activity_types.where(title: "Listing Agreement Paperwork").first.id).count > 0
      listing_agreement_table
    else
    end

    if @property.activities.where(activity_type: @activity_types.where(title: "Other").first.id).count > 0
      other_table
    else
    end
  end
end
