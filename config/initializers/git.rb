#======================================================================
# Display Git commit SHA1 hash
#======================================================================
module Git
  COMMIT = Rails.env.production? ? ENV["HEROKU_SLUG_COMMIT"].to_s[0...7] : `git log --pretty=format:'%h' -n 1`
end
