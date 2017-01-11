module SelectorsHelper
  # Maps a name to a link.
  def selector_to(selector_name)
    return unless selector_name

    case selector_name
    when '側邊功能'
      '#sidebar-menu'
    else
      raise "Can't find mapping from \"#{selector_name}\" to a selector.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World SelectorsHelper
