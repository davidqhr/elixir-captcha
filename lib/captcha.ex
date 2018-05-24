defmodule Captcha do
  def get() do
    Port.open({:spawn, Path.join(:code.priv_dir(:captcha), "captcha")}, [:binary])

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
