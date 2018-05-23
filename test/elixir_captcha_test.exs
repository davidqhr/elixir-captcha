defmodule CaptchaTest do
  use ExUnit.Case
  doctest Captcha

  test "generate image success" do
    assert {:ok, _, _} = Captcha.get()
  end
end
