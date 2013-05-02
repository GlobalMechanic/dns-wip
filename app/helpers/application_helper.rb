module ApplicationHelper
  def is_image(asset)
    %w(jpg jpeg gif png).include?(clean_extension(asset))
  end

  def is_movie(asset)
    %w(mov mp4 m4v mpg).include?(clean_extension(asset))
  end

  def clean_extension(filename)
    extension = File.extname(filename.to_s).downcase
    extension = extension[1..-1] if extension[0,1] == '.'
  end
end
