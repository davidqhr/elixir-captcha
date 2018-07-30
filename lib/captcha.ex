defmodule Captcha do
  def get(timeout \\ 10_000) do
    Port.open({:spawn, Path.join(:code.priv_dir(:captcha), "captcha")}, [:binary])

    # Allow set receive timeout
    receive do
      {_, {:data, data}} ->
        <<text::bytes-size(5), img::binary>> = data
        {:ok, text, img }

      other -> other
    after timeout ->
      { :timeout }
    end
  end
end
