["a", "b", "c"].each do |path|
  dir = Path[Dir.current, path]
  spawn do
    Process.run("shards", args: ["install"], chdir: dir.to_s, input: Process::Redirect::Inherit, output: Process::Redirect::Inherit, error: Process::Redirect::Inherit,)
  end
end