Dir.glob("#{Rails.root}/db/fixtures/development/**/*.rb").sort.each do |file|
  load(file)
end
