require 'pry'
class Pokemon

attr_accessor :name, :type, :db, :id

  def initialize(name)
    self.name = name
    self.type = type
    self.db = db

  end

  def self.save(name, type, db)
    # binding.pry
    # new_poke = self.new(name)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?);", [name, type])

  end

  def self.find(id, db)
    new_data = db.execute("SELECT * FROM pokemon WHERE id = ?;", [id]).flatten
    # binding.pry
    # [0] is id, [1] is name, [2] is type
    new_poke = self.new(new_data[1])
    new_poke.id = new_data[0]
    new_poke.type = new_data[2]
    new_poke
  end


end #of class
