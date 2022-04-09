["a", "b", "c"].each do |path|
  dir = Path[Dir.current, path]
  spawn do
    Process.exec("shards", args: ["install"], chdir: dir.to_s)
  end
end