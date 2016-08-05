namespace :guests do
  desc "Breakup Guest.full_name into first and last names"
  task :breakup_full_name => :environment do
    guests = Guest.all
    guests.each do |guest|
      names = guest.full_name.split(" ")
      guest.update_attributes(first_name: names.first, last_name: names.last)
    end
  end
end
