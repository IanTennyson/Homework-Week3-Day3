require('pg')
require_relative('../db/sql_runner')
require_relative('artist')


class Album

attr_reader :id, :artist_id
attr_writer :title, :genre

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @genre = options['genre']

    @artist_id = options['artist_id'].to_i
  end

  def save()

    sql = "INSERT INTO albums (
    title,
    genre,
    artist_id
    )
    VALUES (
    '#{@title}',
    '#{@genre}',
    #{@artist_id})
    RETURNING *"

    @id = SqlRunner.run(sql).first()['id'].to_i

  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    result = SqlRunner.run(sql)
    albums = result.map { |album| Album.new(album) }
    return albums
  end

  def self.all()
    sql = "SELECT * FROM albums"
    result = SqlRunner.run(sql)
    albums = result.map { |album| Artist.new(album) }
    return albums
  end

    def artist()

      sql = "SELECT * FROM artists WHERE id = #{@artist_id}"

      result = SqlRunner.run(sql)

      return Artist.new(result.first())

    end

    def update()
      
      sql = "UPDATE albums SET (title, genre) = (
      '#{@title}', '#{genre}') WHERE id = #{@id}"

       result = SqlRunner.run(sql)

       return result
    end

    def delete()
      sql = "DELETE FROM albums WHERE id = #{@id}"
      SqlRunner.run(sql)
    end

    def self.find_by_id(id)
      sql = "SELECT * FROM album WHERE id = #{@id}"

      result = SqlRunner.run(sql)

      albums = result.map { |album| Album.new(album) }

      return albums
    end

end