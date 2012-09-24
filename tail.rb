def tail(filename,line,readLength)
  ary=[]
  f=File.open(filename)
  begin
    f.seek(-readLength,IO::SEEK_END)
  rescue
end
  while f.gets
    ary<<$_
  end
  f.close
  return ary[ary.length-line]
end

while true
  puts tail(ARGV[0],1,64)
  sleep 1
end

#http://webcache.googleusercontent.com/search?q=cache:IC4EEhDm_MEJ:www.hirax.net/diaryweb/2010/03/02.html+&cd=9&hl=ja&ct=clnk&gl=jp
