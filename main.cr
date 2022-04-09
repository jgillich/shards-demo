["a", "b", "c"].each do |path|
  dir = Path[Dir.current, b[0]]
  spawn do
    Process.exec("shards", args: ["install"], chdir: dir.to_s)
  end
end