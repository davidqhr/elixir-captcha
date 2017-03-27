defmodule Captcha do
  def get() do
    Port.open({:spawn, "priv/captcha"}, [:binary])

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
