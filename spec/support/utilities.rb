def full_title(page_title)
  base_title = "This is our awesome app"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

def check_links(link_attributes = {})
  visit root_path
  click_link link_attributes[:link]
  expect(page).to have_title(full_title(link_attributes[:page]))
end