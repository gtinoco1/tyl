class ReportPdf < Prawn::Document
  def initialize(property, activity_types)
    super(top_margin: 50)
    @property = property
    @activity_types = activity_types

    property_address
    
    if @property.activities.where(activity_type: @activity_types.where(title: "Showing").first.id).count > 0
    showing_table
    else
    end
    
    if @property.activities.where(activity_type: @activity_types.where(title: "Call").first.id).count > 0
    call_table
    else
    end
    
  end

  def property_address
    text "Report for: #{@property.address.upcase}", size: 15, style: :bold
  end

  def call_table
    move_down 20
    text "Calls", size: 10, style: :bold
    table call_rows, :position => :center, :width => 550, :cell_style => {:font => "Times-Roman"} do
      row(0).font_style = :bold
      columns(1..3).align = :center
      self.row_colors = ["F0F0F0", "FFFFFF"]
      self.header = true
    end
  end
  
    def showing_table
    move_down 20
    text "Showings", size: 10, style: :bold
    table showing_rows, :position => :center, :width => 550, :cell_style => {:font => "Times-Roman"} do
      row(0).font_style = :bold
      columns(1..4).align = :center
      self.row_colors = ["F0F0F0", "FFFFFF"]
      self.header = true
    end
  end

  def call_rows
    [["Date", "Contact", "Details", "Duration (min)"]] +
    @property.activities.where(activity_type: @activity_types.where(title: "Call").first.id).order(date: :desc).map do |activity|
      [activity.date.strftime("%b %d"), activity.contact, activity.detail, activity.duration.to_i]
    end
  end

  def showing_rows
    [["Date", "Agent", "Customer", "Detail", "Duration (min)"]] +
    @property.activities.where(activity_type: @activity_types.where(title: "Showing").first.id).order(date: :desc).map do |activity|
      [activity.date.strftime("%b %d"), activity.agent, activity.customer, activity.detail, activity.duration.to_i]
    end
  end
end
