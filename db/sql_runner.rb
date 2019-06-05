require("pg")

class SqlRunner

  def run(sql, values)
    begin
      db = PG.connect({dbname: "hogwarts", host: "localhost"})
      db.prepare("query", sql)
      db.exec_prepared("query", values)
    ensure
      db.close if db != nil
    end
  end

end
