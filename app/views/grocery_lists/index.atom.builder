atom_feed do |feed|
  logger.error("PRINTING LIST")
  feed.title "Grocery List"
  feed.updated((@grocery_lists.first.created_at))
  
  for grocery_list in @grocery_lists
    feed.entry(grocery_list) do |entry|
      logger.error("  PRINTING ITEM %s" % grocery_list.name)
      entry.title(grocery_list.name)
      entry.content('List contents here', :type => 'html')
      entry.author do |author|
        "The author name"
      end
    end
  end

end