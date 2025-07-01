class Gift < ApplicationRecord
  scope :ordered, -> { order(rating: :desc) }
  scope :random, -> { order("RANDOM()") }

  def self.import_from_csv(path)
    transaction do
      CSV.foreach(path, col_sep: ";", headers: true, strip: true) do |row|
        find_or_initialize_by(name: row.fetch("name")).update!(
          image_url: row.fetch("image_url"),
          url: row.fetch("url")
        )
      end
    end
  end

  def upvote
    increment!(:rating)
  end
end
