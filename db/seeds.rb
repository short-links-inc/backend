records = [
  { slug: :ticket, destination: 'https://www.google.com' }
]

records.each do |record|
  ShortLink.find_or_create_by(slug: record[:slug]) do |s|
    s.destination = record[:destination]
  end
end
