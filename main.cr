ch = Channel(Nil).new
["a", "b", "c", "d", "e", "f", "g"].map do |path|
  dir = Path[Dir.current, path]
  spawn do
    puts dir.to_s
    p = Process.new("shards", args: ["install", "--frozen"], chdir: dir.to_s, input: Process::Redirect::Inherit, output: Process::Redirect::Inherit, error: Process::Redirect::Inherit)
    unless p.wait.normal_exit?
      exit 1
    end
    p = Process.new("crystal", args: ["run", "main.cr"], chdir: dir.to_s, input: Process::Redirect::Inherit, output: Process::Redirect::Inherit, error: Process::Redirect::Inherit)
    unless p.wait.normal_exit?
      exit 1
    end

    ch.send(nil)
  end
end.each { ch.receive }