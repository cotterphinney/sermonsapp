# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Series.destroy_all
Sermon.destroy_all

ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'sermons'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'series'")

def seed_image(file_name)
  File.open(File.join("#{Rails.root}/app/assets/images/#{file_name}"))
end

1.upto(14) do |index|
  Series.create(
      title: 'This is the title of Series number '+index.to_s,
      image: seed_image('series' + index.to_s + '.jpg')
  )
end

1.upto(11) do |index|
  info = {
      title: 'This is the title of Sermon number '+index.to_s,
      series: Series.find([1,2,3,4].sample),
      date: Time.now,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
  }
  if index <= 5
    info[:image] = seed_image('sermon' + index.to_s + '.jpg')
  end

  Sermon.create(info)
end