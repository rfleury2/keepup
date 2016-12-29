rich_user = User.find_by(email: 'joe@user.com') || User.create!(first_name: 'Joe', last_name: 'User', email: 'joe@user.com', password: 'danpatrick', password_confirmation: 'danpatrick')
empty_user = User.find_by(email: 'john@user.com') || User.create!(first_name: 'John', last_name: 'User', email: 'john@user.com', password: 'danpatrick', password_confirmation: 'danpatrick')

rich_user.contacts.find_or_create_by!(name: 'Carlos Contact', email: 'carlos@contact.com')
rich_user.contacts.find_or_create_by!(name: 'Chuck Contact', email: 'chuck@contact.com')
rich_user.contacts.find_or_create_by!(name: 'Carla Contact', email: 'carla@contact.com')
rich_user.contacts.find_or_create_by!(name: 'Charles Contact', email: 'charles@contact.com')