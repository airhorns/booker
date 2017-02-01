module ApplicationHelper
  def tel_link(text)
    sets_of_numbers = text.scan(/[0-9]+/)
    number = "+1-#{sets_of_numbers.join('-')}"
    link_to text, "tel:#{number}"
  end

  def listing_image(listing, *args)
    url = if listing.image_url
      listing.image_url
    else
      'generic-house.png'
    end
    image_tag(url, *args)
  end

  def listing_active_string(listing)
    if listing.activated_at
      "Active now"
    else
      "Inactive"
    end
  end
end
