defmodule Captcha do
  def get(timeout \\ 1_000) do
    case System.cmd(Path.join(Path.dirname(__ENV__.file), "../priv/captcha"), []) do
      {data, 0} ->
        <<text::bytes-size(5), img::binary>> = data
        {:ok, text, img}

      other ->
        :error
    end
  end
end
