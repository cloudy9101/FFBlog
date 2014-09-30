namespace :db do	
	desc "Fill database with sample data"
	task populate: :environment do
		User.create(name: "Example User",
			email: "example@example.com",
			password: "foobar",
			password_confirmation: "foobar")
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@example.com"
			password = "foobar"
			User.create!(name: name,
				email: email,
				password: password,
				password_confirmation: password)
		end
		users = User.all.limit(6)
		50.times do |n|
			content = Faker::Lorem.sentence(5)
			users.each { |user| user.posts.create!(title: "#{content}-#{user.name}-#{n+1}", text: content) }
		end
	end
end