require 'sqlite3'


class QuestionsDatabase <SQLite3::DATABASE 
    include Singleton

    def intialize 
        super('import_db.sql')
        self.type_translation = true 
        self.results_as_hash = true 
    end   
end     

class Users 
    def self.all
        data = QuestionsDatabase.instance.execute('SELECT * FROM plays')
        data.map {|datum| Users.new(datum)}
    end


        
    def self.find_by_name(fname, lname)
        QuestionsDatabase.instance.execute(<<-SQL)
            SELECT
                *
            FROM
                users
            WHERE
                users.fname = fname AND users.lname = lname
        SQL

    end    
    
    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end 
    
    def create 
        raise "#{self} already in databease" if @id 
        QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
            INSERT INTO
                users (fname, lname)
            VALUES
                (?,?)
        SQL
        @id = QuestionsDatabase.instance.last_insert_row_id
    end  
end    


class Questions 
    self.find_by_id(id)
        id= QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                id = ?
        SQL    
        return nil unless !id.nil?
    end

end    