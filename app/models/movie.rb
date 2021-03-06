class Movie < ActiveRecord::Base

  has_many :reviews, dependent: :destroy

  RATINGS = %W(G PG PG-13 R NC-17)
  validates :rating, inclusion: { in: RATINGS }
  validates :title, :released_on, :duration, presence: true
  validates :description, length: { minimum: 25 }
  validates :total_gross, numericality: { greater_than_or_equal_to: 0 }
  validates :image_file_name, allow_blank: true, format: {
    with: /\w+\.(gif|jpg|jpeg|png)\z/i,
    message: 'must be a GIF, JPG, JPEG or PNG file'
  }

  def flop?
    total_gross.blank? || total_gross < 50000000
  end

  def self.released
    where('released_on <= ?', Time.now).order('released_on desc')
  end

  def average_stars
    reviews.average(:stars)
  end

end
