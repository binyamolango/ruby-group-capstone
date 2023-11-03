require './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :author, :archived

  def initialize(publish_date, multiplayer, last_played_at, _author)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    parent_can_be_archived = super
    Date.today.prev_year(10)
    last_played_date = Date.parse(@last_played_at)
    return true if parent_can_be_archived && last_played_date < Date.today.prev_year(2)

    false
  end
end