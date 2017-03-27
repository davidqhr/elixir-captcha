defmodule Captcha do
  def get() do
    Port.open({:spawn, Path.join(Path.dirname(__ENV__.file), "../priv/captcha")}, [:binary])

    receive do
      {_, {:data, data}} ->
        <<text::bytes-size(5), img::binary>> = data
        {:ok, text, img }
      other -> other
    after
      1_000 -> { :timeout }
    end
  end
end
