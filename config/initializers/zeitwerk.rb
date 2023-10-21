Rails.autoloaders.each do |loader|
    loader.ignore(File.join(__dir__, "../app/forms/admin")) 
  end