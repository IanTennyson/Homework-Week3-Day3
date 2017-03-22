require('pg')
require_relative('../db/sql_runner')


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

  def self.delete_all
    sql = "DELETE FROM albums"
    result = SqlRunner.run(sql)
    albums = result.map { |album| Album.new(album) }
    return albums
  end

end