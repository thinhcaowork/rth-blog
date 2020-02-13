image_sources = ['spec/fixtures/images/pexels-photo-208568.jpeg', 'spec/fixtures/images/pexels-photo-308663.jpeg', 'spec/fixtures/images/pexels-photo-404630.jpeg']

User.seed(
  :id,
  { id: 1, first_name: 'Thinh', last_name: 'cao', email: 'thinh.cao@hotmail.com', password: '123456', image: Rails.root.join(image_sources.sample).open },
  { id: 2, first_name: 'Tavin', last_name: 'C', email: 'tavin@example.com', password: '123456', image: Rails.root.join(image_sources.sample).open },
  { id: 3, first_name: 'Ken', last_name: 'N', email: 'ken@example.com', password: '123456', image: Rails.root.join(image_sources.sample).open },
  { id: 4, first_name: 'Sam', last_name: 'S', email: 'sam@example.com', password: '123456', image: Rails.root.join(image_sources.sample).open }
)
