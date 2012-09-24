# coding:utf-8

class UtilForMessagesFile
  def self.file_name(member_code)
    "messages/messages_" + member_code + "_.txt"
  end
  
  def self.read(member_code)
    File.open(file_name(member_code)){|f|
      contents = f.read
      return contents
    }
  end
  def self.write(member_code, input)
    File.open(file_name(member_code), 'a'){|f|
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
    resp.body = UtilForMessagesFile.read(req.query['member_code'])
    raise WEBrick::HTTPStatus::OK
  end
end

class Add < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(req, resp)
    UtilForMessagesFile.write(req.query['member_code'], req.query['text'] )
    resp.content_type = "text"
    resp.body = UtilForMessagesFile.read(req.query['member_code']) 
    raise WEBrick::HTTPStatus::OK
  end
end
