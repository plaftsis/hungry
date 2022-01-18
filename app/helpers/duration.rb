module Duration
  # Converts duration in minutes to human readable format
  # Returns string
  def humanize(duration)
    s = ""
    parts = ActiveSupport::Duration.build(duration.minutes).parts
    s += "#{parts[:days]}d " if parts.key?(:days)
    s += "#{parts[:hours]}h " if parts.key?(:hours)
    s += "#{parts[:minutes]}m " if parts.key?(:minutes)
    s.strip
  end
  module_function :humanize
end
