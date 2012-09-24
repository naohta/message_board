# coding:utf-8

class UtilForMessagesFile
  def self.file_name(m_cd)
    "messages/messages_" + m_cd + "_.txt"
  end
  
  def self.read(m_cd)
    File.open(file_name(m_cd)){|f|
      contents = f.read
      return contents
    }
  end
  def self.write(m_cd, input)
    File.open(file_name(m_cd), 'a'){|f|
      #f.puts Time.now.strftime("%Y-%m-%d %H:%M")
      t = Time.now
      f.puts t.strftime("%Y年%m月%d日(#{%w(日 月 火 水 木 金 土)[t.wday]}) %H時%M分 ")
      f.puts input
      f.puts "----------"
    }
  end
end

class Show < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(req, resp)
    resp.body = UtilForMessagesFile.read(req.query['m_cd'])
    raise WEBrick::HTTPStatus::OK
  end
end

class Add < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(req, resp)
    UtilForMessagesFile.write(req.query['m_cd'], req.query['text'] )
    resp.content_type = "text"
    resp.body = UtilForMessagesFile.read(req.query['m_cd']) 
    raise WEBrick::HTTPStatus::OK
  end
end
