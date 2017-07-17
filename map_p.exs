defimpl String.Chars, for: Map do
  def to_string(map) do
    case Enum.count(map) do
      0 -> "blank-map" # 要素数0の時
      _ -> inspect map
    end
  end
end
