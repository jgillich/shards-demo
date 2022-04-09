ch = Channel(Nil).new
["a", "b", "c", "d", "e", "f", "g"].map do |path|
  dir = Path[Dir.current, path]
  spawn do
    puts dir.to_s
    Process.run("shards", args: ["install"], chdir: dir.to_s, input: Process::Redirect::Inherit, output: Process::Redirect::Inherit, error: Process::Redirect::Inherit,)
    ch.send(nil)
  end
end.each { ch.receive }