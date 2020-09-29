class BrowserHistory < ApplicationRecord
  validates :url, presence: true

  def next
    BrowserHistory.where("id > ?", id).first || self
  end

  def prev
    BrowserHistory.where("id < ?", id).last || self
  end
end
