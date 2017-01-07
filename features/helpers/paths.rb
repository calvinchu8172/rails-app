module PathsHelper

  def path_to(page_name)

    case page_name

    when /the home|the dashboard/
      root_path

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World PathsHelper
